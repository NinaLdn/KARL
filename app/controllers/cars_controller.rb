require "json"
require "rest-client"
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'date'

class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :first_estimation, :start, :final_validation]

  def final_validation
    # USERSTORY 5 : SHOW DU FORM + FINAL EDIT
    # @car = Car.find(params[:id])
  end

  def new
    # USERSTORY 1: HOME PAGE
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    @car.registration_number = params[:car][:registration_number]

    url_immatriculation = "http://www.regcheck.org.uk/api/reg.asmx/CheckFrance?RegistrationNumber=#{@car.registration_number}&username=Nina"
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
      registration_date: Date.parse("#{immatriculation_data[:RegistrationDate].last(4)}-#{immatriculation_data[:RegistrationDate][2..3]}-#{immatriculation_data[:RegistrationDate].first(2)}"),
      fiscal_horsepower: immatriculation_data.dig(:EngineSize)[:CurrentTextValue],
      maximum_net_power: immatriculation_data.dig(:ExtendedData, :puissanceDyn),
      body: immatriculation_data.dig(:BodyStyle)[:CurrentTextValue],
      estimated_kilometers: @car.estimated_kilometers
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
    # date_string = @car.registration_date.to_s
    # date_autovisual = Date.parse("#{date_string.last(4)}-#{date_string[2..3]}-#{date_string.first(2)}")
    request["content-type"] = 'application/json'
    request.body = "{\"key\":\"ATxfo4jsMy6RD4M6YtaoU572gRuSjzdQAqWWG3khcLua\",\"txt\":\"#{@car.car_brand} #{@car.model_type} #{@car.body} #{@car.model_variant}\",\"km\":\"#{@car.estimated_kilometers}\",\"dt_entry_service\":\"#{@car.registration_date}\",\"fuel\":\"#{@car.fuel_type}\",\"transmission\":\"#{@car.gearbox}\",\"country_ref\":\"FR\",\"seats\":\"#{@car.seating_place_number}\",\"value\":\"true\",\"transaction\":\"true\",\"market\":\"true\"}"
    autovisual_response = http.request(request).read_body
    market_data = JSON.parse(autovisual_response, {symbolize_names: true})
    @car.update_attributes(
      estimated_price: market_data.dig(:value, :b),
      marge_nego: market_data.dig(:transaction, :nego),
      rotation: market_data.dig(:transaction, :rotation),
      deval_250: market_data.dig(:transaction, :deval, :'250'),
      deval_500: market_data.dig(:transaction, :deval, :'500'),
      deval_750: market_data.dig(:transaction, :deval, :'750'),
      deval_1000: market_data.dig(:transaction, :deval, :'1000'),
      deval_1250: market_data.dig(:transaction, :deval, :'1250'),
      deval_1500: market_data.dig(:transaction, :deval, :'1500'),
      deval_1750: market_data.dig(:transaction, :deval, :'1750'),
      deval_2000: market_data.dig(:transaction, :deval, :'2000'),
      deval_fix: market_data.dig(:transaction, :deval, :fixe),
    )
    forecasts = market_data.dig(:transaction, :forecast).each do |forecast|
        if forecast[:days] == 30
       @car.update_attributes(
          forecast_30_days: forecast[:days],
          forecast_30_value: forecast[:value],
          forecast_30_delta: forecast[:delta])
        elsif forecast[:days] == 60
          @car.update_attributes(
          forecast_60_days: forecast[:days],
          forecast_60_value: forecast[:value],
          forecast_60_delta: forecast[:delta])
        else
          @car.update_attributes(
          forecast_90_days: forecast[:days],
          forecast_90_value: forecast[:value],
          forecast_90_delta: forecast[:delta])
        end
      end

    @car.save

    if @car.save
      redirect_to first_estimation_car_path(@car)
    else
      render :new
    end
  end

  def edit
    # @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to new_car_damage_path(@car)
  end

  def first_estimation
    @car_prices=[@car.estimated_price, @car.estimated_price*0.7]
    # USERSTORY 2: SHOW DE LA FIRST ESTIMATION
    # @car = Car.find(params[:id])
  end

  def start
    # USERSTORY 3 : CALL TO ACTION "START"
    # @car = Car.find(params[:id])
  end


  def final_message
    # USERSTORY 6: MESSAGE DE VALIDATION FINALE
  end

  def destroy
    # USERSTORY 7 : DELETE ANNOUNCE
    @car.destroy
    redirect_to root_path
  end

private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:registration_number, :estimated_kilometers, :exact_kilometer, :why_selling, :photo_1, :photo_2, :photo_3, :car_brand, :model_type, :model_variant, :gearbox, :fuel_type, :seating_place_number, :first_registration_date, :fiscal_horsepower, :maximum_net_power, :body )
  end
end
