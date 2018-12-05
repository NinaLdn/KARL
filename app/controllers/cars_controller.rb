require "json"
require "rest-client"
require 'nokogiri'
require 'open-uri'

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :first_estimation, :start, :final_validation]
  # def index
  #   # FOR ALL CARS OF 1 USER
  #   @cars = Car.all
  # end

  def show
    # FOR THE TECHNICAL DATA SEEH OF 1 CAR
    # @car = Car.find(params[:id])
  end

  def new
    # USER STORY 1: HOME PAGE
    @car = Car.new
  end

  def create
    # USER STORY 1: HOME PAGE
    @car = Car.new(car_params)
    @car.user = current_user
    @car.registration_number = params[:car][:registration_number]

    # call first API

    url_immatriculation = "http://www.regcheck.org.uk/api/reg.asmx/CheckFrance?RegistrationNumber=#{@car.registration_number}&username=vincentbrass"
    immatriculation_xml_data = Nokogiri::XML(open(url_immatriculation).read)
    vehicule_json = immatriculation_xml_data.text.strip
    raise
    # immatriculation_xml_data.root.xpath('Vehicle').each do |vehicle|
    #   vehicle_json = vehicle.xpath('vehicleJson')
    # end
    # immatriculation_response = RestClient.get(url_immatriculation)
    # immatriculation_data = JSON.parse(immatriculation_response, {symbolize_names: true})
    immatriculation_data = JSON.parse(vehicule_json, {symbolize_names: true})
    car_attributes = {
      car_brand: immatriculation_data.dig(:MakeDescription),
      model_type: immatriculation_data.dig(:ModelDescription),
      model_variant: immatriculation_data.dig(:modele),
      gearbox: immatriculation_data.dig(:boiteDeVitesse),
      fuel_type: immatriculation_data.dig(:FuelType),
      seating_place_number: immatriculation_data.dig(:nbPlace),
      first_registration_date: immatriculation_data.dig(:RegistrationDate),
      fiscal_horsepower: immatriculation_data.dig(:EngineSize),
      maximum_net_power: immatriculation_data.dig(:puissanceDyn),
      body: immatriculation_data.dig(:BodyStyle),
      estimated_kilometers: 120002
    }
    raise
    # create or upate car?

    @car = Car.save!(car_attributes)

    # call second api

    url_autovisual = URI("https://api.autovisual.com/v2/av")

    http = Net::HTTP.new(url_autovisual.host, url_autovisual.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request.body = "{\"key\":\"18Tzw994VXvkZ6GrrfVY796hLtcCYdv6nLwnk1V8KcsT\",\"txt\":\"#{@car.brand} #{@car.type} #{@car.model_type} #{@car.model_variant}\",\"km\":\"#{@car.estimated_kilometers}\",\"dt_entry_service\":\"#{@car.first_registration_date}\",\"fuel\":\"#{@car.fuel_type}\",\"transmission\":\"#{@car.gearbox}\",\"country_ref\":\"FR\",\"seats\":\"#{@car.seating_place_number}\",\"value\":\"true\",\"transaction\":\"true\",\"market\":\"true\"}"
    autovisual_response = http.request(request)
    market_data = JSON.parse(autovisual_response, {symbolize_names: true})

    car_new_attributes = {
      estimated_price: autovisual_data.dig(:value, :c)
    }

    @car = Car.update(car_new_attributes)

    if @car.save
      redirect_to first_estimation_car_path(@car)
    else
      render :new
    end
  end

  def edit
    # USER STORY 4 et 5: Edit info complementaires
    # INFO COMPLEMENTAIRES SUR PLUSIEURS PAGES (TO SAVE A CHAQUE ETAPE DE L'EDIT): KILOMETRAGE EXACT / PICTURES / WHY_SELLING / VALIDATION DE L ANNONCE
  end

  def update
    # USER STORY 4 et 5: Edit info complementaires
    # INFO COMPLEMENTAIRES SUR PLUSIEURS PAGES (TO SAVE A CHAQUE ETAPE DE L'EDIT): KILOMETRAGE EXACT / PICTURES / WHY_SELLING / VALIDATION DE L ANNONCE
    # if
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to final_validation_car_path(@car)
    # else
    #   render :edit
    # end
  end

  def destroy
  end

  def first_estimation
    # USER STORY 2
    # @car = Car.find(params[:id])
    # pricing API Argus pour estimation du prix
    # redirect_to start page
  end

  def start
    # USER STORY 3 : EDIT
    # @car = Car.find(params[:id])
  end

  def final_validation
    # USER STORY 3 : EDIT
    # @car = Car.find(params[:id])
  end
  def final_message
    # USER STORY 6: MESSAGE DE VALIDATION QUE L'ANNONCE EST BIEN POSTEE
  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:registration_number, :estimated_kilometers, :exact_kilometer, :why_selling, :photo_1, :photo_2, :photo_3, :car_brand, :model_type, :model_variant, :gearbox, :fuel_type, :seating_place_number, :first_registration_date, :fiscal_horsepower, :maximum_net_power, :body )
  end

end
