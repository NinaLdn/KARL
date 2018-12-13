class DamagesController < ApplicationController
  before_action :set_damage, only: [:edit, :update, :destroy]

  def new
    @car = Car.find(params[:car_id])
    @damage = Damage.new
  end

  def create

    @car = Car.find(params[:car_id])
    @damage = Damage.new(damage_params)
    @damage.car_id = @car.id
    if @damage.save
      redirect_to final_validation_car_path(@car.id)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:car_id])
  end

  def update
    @car = Car.find(params[:car_id])
    @damage.update(damage_params)
    redirect_to final_validation_car_path(@car.id)

  end

  def destroy
    @car = Car.find(params[:car_id])
    @damage.destroy
    redirect_to final_validation_car_path(@car.id)
  end

private

  def set_damage
    @damage = Damage.find(params[:id])
  end

  def damage_params
    params.require(:damage).permit(:car_id, :nature, :title, :description, :picture_1, :picture_2, :picture_3)
  end
end
