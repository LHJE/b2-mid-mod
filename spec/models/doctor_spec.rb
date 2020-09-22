require 'rails_helper'

RSpec.describe Doctor do
  describe 'Relationships' do
    it {should have_many :surgeries}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :specialty}
    it {should validate_presence_of :university}
  end

end
