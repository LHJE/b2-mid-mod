class DoctorSurgeriesController < ApplicationController

  def update
    @surgery = Surgery.find(params[:id])
    @doctor_surgeries = DoctorSurgery.where(surgery_id: @surgery.id)
    @new_doctor = Doctor.where(name: params[:name]).reduce
    DoctorSurgery.create!(surgery_id: @surgery.id, doctor_id: @new_doctor.id)
    redirect_to "/surgeries/#{@surgery.id}"
  end

end
