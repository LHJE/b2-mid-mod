class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
    @doctor_surgeries = DoctorSurgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @doctor_surgeries = DoctorSurgery.all
  end

end
