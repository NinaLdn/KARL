class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :first_estimation, :start, :final_validation]
  def index
    # FOR ALL CARS OF 1 USER
    @cars = Booking.all
  end

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
    params.require(:car).permit(:registration_number, :estimated_kilometers, :exact_kilometer, :why_selling, :photo_1, :photo_2, :photo_3)
  end

end
