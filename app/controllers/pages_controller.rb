class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @car = Car.new
  end

  def dashboard
    @cars = current_user.cars
    @cars.each do |car|
      if car.estimated_price && car.deval_fix
        @car_price_evolution = [car.estimated_price, car.estimated_price*(1-car.deval_fix), car.estimated_price*(1-car.deval_fix)**2,car.estimated_price*(1-car.deval_fix)**3, car.estimated_price*(1-car.deval_fix)**4]
      end
    end
  end

end
