class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
    @doctor_surgeries = DoctorSurgery.all
  end

  def show

  end

end
