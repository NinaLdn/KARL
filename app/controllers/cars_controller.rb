require "json"
require "rest-client"
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'date'

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :first_estimation, :start, :final_validation]

  def show
    # FOR THE TECHNICAL DATA SHEET OF 1 CAR = FINAL VALIDATION
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

    url_immatriculation = "http://www.regcheck.org.uk/api/reg.asmx/CheckFrance?RegistrationNumber=#{@car.registration_number}&username=vincentbrass"
    immatriculation_xml_data = Nokogiri::XML(open(url_immatriculation).read)
    vehicule_json = immatriculation_xml_data.at_css("vehicleJson").text
    immatriculation_data = JSON.parse(vehicule_json, {symbolize_names: true})
    @car.update_attributes(
      car_brand: immatriculation_data.dig(:MakeDescription)[:CurrentTextValue],
      model_type: immatriculation_data.dig(:ModelDescription)[:CurrentTextValue],
      model_variant: immatriculation_data.dig(:ExtendedData, :modele),
      gearbox: immatriculation_data.dig(:ExtendedData, :boiteDeVitesse),
      # fuel_type: immatriculation_data.dig(:FuelType)[:CurrentTextValue],
      fuel_type: 'gasoline',
      seating_place_number: immatriculation_data.dig(:ExtendedData, :nbPlace),
      first_registration_date: immatriculation_data[:RegistrationDate],
      fiscal_horsepower: immatriculation_data.dig(:EngineSize)[:CurrentTextValue],
      maximum_net_power: immatriculation_data.dig(:ExtendedData, :puissanceDyn),
      body: immatriculation_data.dig(:BodyStyle)[:CurrentTextValue],
      estimated_kilometers: 120002
    )
    # create or upate car?
    @car.save
    # @car = Car.save!(car_attributes)

    # call second api

    url_autovisual = URI("https://api.autovisual.com/v2/av")

    http = Net::HTTP.new(url_autovisual.host, url_autovisual.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url_autovisual)
    date_string = @car.first_registration_date.to_s
    date_autovisual = Date.parse("#{date_string.last(4)}-#{date_string[2..3]}-#{date_string.first(2)}")
    request["content-type"] = 'application/json'
    request.body = "{\"key\":\"18Tzw994VXvkZ6GrrfVY796hLtcCYdv6nLwnk1V8KcsT\",\"txt\":\"#{@car.car_brand} #{@car.model_type} #{@car.body} #{@car.model_variant}\",\"km\":\"#{@car.estimated_kilometers}\",\"dt_entry_service\":\"#{date_autovisual}\",\"fuel\":\"#{@car.fuel_type}\",\"transmission\":\"#{@car.gearbox}\",\"country_ref\":\"FR\",\"seats\":\"#{@car.seating_place_number}\",\"value\":\"true\",\"transaction\":\"true\",\"market\":\"true\"}"
    autovisual_response = http.request(request).read_body
    market_data = JSON.parse(autovisual_response, {symbolize_names: true})

    @car.update_attributes(
      estimated_price: market_data.dig(:value, :c)
    )

    @car.save

    if @car.save
      redirect_to first_estimation_car_path(@car)
    else
      render :new
    end
  end

  def edit
    # USER STORY 4: EDIT EXACT INFO
    # INFO COMPLEMENTAIRES SUR PLUSIEURS PAGES (TO SAVE A CHAQUE ETAPE DE L'EDIT): KILOMETRAGE EXACT / PICTURES / WHY_SELLING / VALIDATION DE L ANNONCE
  end

  def update
    # USER STORY 4: EDIT EXACT INFO
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
    # USER STORY 7 : DELETE ANNOUNCE AND GOT BACK TO THE HOME PAGE
    @car.destroy
    redirect_to root_path
  end

  def first_estimation
    # USER STORY 2: SHOW DE LA FIRST ESTIMATION
    # @car = Car.find(params[:id])
    # pricing API Argus pour estimation du prix
    # redirect_to start page
  end

  def start
    # USER STORY 3 : CALL TO ACTION "START"
    # @car = Car.find(params[:id])
  end

  def final_validation
    # USER STORY 5 : SHOW DU FORM + EDIT
    # @car = Car.find(params[:id])
  end
  def final_message
    # USER STORY 6: MESSAGE DE VALIDATION FINALE
  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:registration_number, :estimated_kilometers, :exact_kilometer, :why_selling, :photo_1, :photo_2, :photo_3, :car_brand, :model_type, :model_variant, :gearbox, :fuel_type, :seating_place_number, :first_registration_date, :fiscal_horsepower, :maximum_net_power, :body )
  end

end
