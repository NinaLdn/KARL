require 'rest-client'
require 'json'
require 'uri'
require 'net/http'
# response = RestClient::Request.execute(method: :get, url: 'c8d5acf2-d9b8-4dd1-bb5a-398198c9e6ef.mock.pstmn.io/checkout/3.0/matchings/42?include=vehicle,candidates,registration-card', headers: {x-api-key :b2f565a06a90405ebd4fdd6926b81cac})

# Argus

# url_immatriculation = http://www.regcheck.org.uk/api/reg.asmx/CheckFrance?RegistrationNumber=eg258ma&username=vincentbrass
# url = 'c8d5acf2-d9b8-4dd1-bb5a-398198c9e6ef.mock.pstmn.io/checkout/3.0/matchings/42?include=vehicle,candidates,registration-card'
# response = RestClient.get(url, {'x-api-key' => 'b2f565a06a90405ebd4fdd6926b81cac'})
# filepath = 'tmp/response.json'
# response = File.read(filepath)

# data = JSON.parse(response, {symbolize_names: true})
# selected_data = data.dig(:data)
# pp selected_data


# Immatriculation-API

filepath = 'API_responses/immatriculation-api.json'
immatriculation_response = File.read(filepath)
immatriculation_data = JSON.parse(response, {symbolize_names: true})

# harmonize car attributes with DB

car_attributes = {
  car_brand: immatriculation_data.dig(:MakeDescription),
  model_type: immatriculation_data.dig(:ModelDescription),
  model_variant: immatriculation_data.dig(:modele)
  gearbox: immatriculation_data.dig(:boiteDeVitesse),
  fuel_type: immatriculation_data.dig(:FuelType),
  seating_place_number: immatriculation_data.dig(:nbPlace)
  first_registration_date: immatriculation_data.dig(:RegistrationDate),
  fiscal_horsepower: immatriculation_data.dig(:EngineSize),
  maximum_net_power: immatriculation_data.dig(:puissanceDyn),
  body: immatriculation_data.dig(:BodyStyle),
  estimated_kilometers: 12000
}

# Create new car - create action

car = Car.create(car_attributes)

# Autovisual-API

# __ post harmonized data

var request = require("request");

var options = { method: 'POST',
  url: 'https://api.autovisual.com/v2/av',
  headers: { 'content-type': 'application/json' },
  body:
   { txt: "#{car.brand} #{car.type} #{car.model_type} #{car.model_variant}",
     km: car.estimated_kilometers,
     dt_entry_service: car.first_registration_date,
     fuel: car.fuel_type,
     transmission: car.gearbox,
     country_ref: 'FR',
     value: 'true',
     transaction: 'true',
     market: 'true',
     seats: car.seating_place_number },
  json: true };

request(options, function (error, response, body) {
  if (error) throw new Error(error);
});

# __ get additional information

filepath = 'API_responses/autovisual-api.json'
autovisual_response = File.read(filepath)
autovisual_data = JSON.parse(response, {symbolize_names: true})

# __ update car / enrich car with market data

car_new_attributes {
  estimated_price: autovisual_data.dig(:value, :c)
}

car = Car.update(car_new_attributes)


# Autoscout-API

# __ post description to autoscout api including non-informed mandatory attributes



# filepath = 'API_responses/autoscout-api.json'
# response = File.read(filepath)
# data = JSON.parse(response, {symbolize_names: true})
# puts data

