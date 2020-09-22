class DoctorSurgeriesController < ApplicationController

  def update
    @surgery = Surgery.find(params[:id])
    @new_doctor = Doctor.where(name: params[:name]).reduce
    if @new_doctor.hospital_id == @surgery.hospital_id
      DoctorSurgery.create!(surgery_id: @surgery.id, doctor_id: @new_doctor.id)
    end
    redirect_to "/surgeries/#{@surgery.id}"
  end

end
