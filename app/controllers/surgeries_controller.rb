class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
    @doctor_surgeries = DoctorSurgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @other_surgeries = Surgery.where(day: @surgery.day)
  end

end
