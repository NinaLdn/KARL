class AddForecastToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :forecast_30_days, :integer
    add_column :cars, :forecast_30_value, :integer
    add_column :cars, :forecast_30_delta, :integer
    add_column :cars, :forecast_60_days, :integer
    add_column :cars, :forecast_60_value, :integer
    add_column :cars, :forecast_60_delta, :integer
    add_column :cars, :forecast_90_days, :integer
    add_column :cars, :forecast_90_value, :integer
    add_column :cars, :forecast_90_delta, :integer
  end
end
