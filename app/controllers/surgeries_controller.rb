class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @other_surgeries = Surgery.where(day: @surgery.day)
    @doctors = Doctor.where(id: DoctorSurgery.where(surgery_id: @surgery.id).pluck(:doctor_id)).pluck(:name)
  end

end
