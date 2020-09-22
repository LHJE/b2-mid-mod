require 'rails_helper'

RSpec.describe DoctorSurgery do
  describe 'relationships' do
    it {should belong_to :surgery}
    it {should belong_to :doctor}
  end
end
