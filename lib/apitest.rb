require 'rest-client'
require 'json'
# response = RestClient::Request.execute(method: :get, url: 'c8d5acf2-d9b8-4dd1-bb5a-398198c9e6ef.mock.pstmn.io/checkout/3.0/matchings/42?include=vehicle,candidates,registration-card', headers: {x-api-key :b2f565a06a90405ebd4fdd6926b81cac})

url = 'c8d5acf2-d9b8-4dd1-bb5a-398198c9e6ef.mock.pstmn.io/checkout/3.0/matchings/42?include=vehicle,candidates,registration-card'
# response = RestClient.get(url, {'x-api-key' => 'b2f565a06a90405ebd4fdd6926b81cac'})
filepath = 'tmp/response.json'
response = File.read(filepath)

data = JSON.parse(response, {symbolize_names: true})
selected_data = data.dig(:data)
puts selected_data
