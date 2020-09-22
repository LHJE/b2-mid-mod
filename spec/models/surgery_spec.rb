require 'rails_helper'

RSpec.describe Surgery do
  describe 'Relationships' do
    it {should have_many :doctors}
  end

  describe 'Validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :day}
    it {should validate_presence_of :operating_room_number}
  end
end
