class Hospital::SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.where(hospital_id: params[:id]).order(:operating_room_number)
  end
end
