require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Surgery Index' do
  describe 'As a visitor ' do
    before :each do
      @surgery_1 = Surgery.create!(title: "Lungs", day: "Monday", operating_room_number: 1)
      @surgery_4 = Surgery.create!(title: "Arms", day: "Monday", operating_room_number: 4)
      @surgery_8 = Surgery.create!(title: "Hands", day: "Monday", operating_room_number: 8)
      @surgery_2 = Surgery.create!(title: "Heart", day: "Tuesday", operating_room_number: 2)
      @surgery_3 = Surgery.create!(title: "Legs", day: "Thusday", operating_room_number: 3)
      @surgery_5 = Surgery.create!(title: "Head", day: "Friday", operating_room_number: 5)
      @surgery_6 = Surgery.create!(title: "Chest", day: "Saturday", operating_room_number: 6)
      @surgery_7 = Surgery.create!(title: "Feet", day: "Sunday", operating_room_number: 7)

      @hospital_1 = Hospital.create!(name: "Big one")
      @hospital_2 = Hospital.create!(name: "Local one")

      @doctor_1 = Doctor.create!(name: "Jackie Chan", specialty: "Lungs", university: "Large State", hospital_id: @hospital_1.id)
      @doctor_2 = Doctor.create!(name: "Terry Pratchett", specialty: "Heart", university: "Smallville", hospital_id: @hospital_1.id)
      @doctor_3 = Doctor.create!(name: "Cynthia Rothrock", specialty: "Head", university: "Ahnk Morpork", hospital_id: @hospital_2.id)
      @doctor_4 = Doctor.create!(name: "Scott Adkins", specialty: "Feet", university: "Lancre", hospital_id: @hospital_2.id)

      @doctor_surgery_1 = DoctorSurgery.create!(surgery_id: @surgery_1.id, doctor_id: @doctor_1.id)
      @doctor_surgery_9 = DoctorSurgery.create!(surgery_id: @surgery_1.id, doctor_id: @doctor_3.id)
      @doctor_surgery_13 = DoctorSurgery.create!(surgery_id: @surgery_1.id, doctor_id: @doctor_4.id)

      @doctor_surgery_2 = DoctorSurgery.create!(surgery_id: @surgery_2.id, doctor_id: @doctor_1.id)
      @doctor_surgery_14 = DoctorSurgery.create!(surgery_id: @surgery_2.id, doctor_id: @doctor_4.id)
      @doctor_surgery_10 = DoctorSurgery.create!(surgery_id: @surgery_2.id, doctor_id: @doctor_3.id)

      @doctor_surgery_3 = DoctorSurgery.create!(surgery_id: @surgery_3.id, doctor_id: @doctor_1.id)
      @doctor_surgery_11 = DoctorSurgery.create!(surgery_id: @surgery_3.id, doctor_id: @doctor_3.id)

      @doctor_surgery_4 = DoctorSurgery.create!(surgery_id: @surgery_4.id, doctor_id: @doctor_1.id)
      @doctor_surgery_12 = DoctorSurgery.create!(surgery_id: @surgery_4.id, doctor_id: @doctor_3.id)

      @doctor_surgery_5 = DoctorSurgery.create!(surgery_id: @surgery_5.id, doctor_id: @doctor_2.id)

      @doctor_surgery_6 = DoctorSurgery.create!(surgery_id: @surgery_6.id, doctor_id: @doctor_2.id)

      @doctor_surgery_15 = DoctorSurgery.create!(surgery_id: @surgery_7.id, doctor_id: @doctor_4.id)
      @doctor_surgery_7 = DoctorSurgery.create!(surgery_id: @surgery_7.id, doctor_id: @doctor_2.id)

      @doctor_surgery_8 = DoctorSurgery.create!(surgery_id: @surgery_8.id, doctor_id: @doctor_2.id)
      @doctor_surgery_16 = DoctorSurgery.create!(surgery_id: @surgery_8.id, doctor_id: @doctor_4.id)

      visit "/surgeries"
    end

    it "I can click on any surgery title and go to show page" do
      expect(page).to have_link("#{@surgery_1.title}")

      click_link "#{@surgery_1.title}"

      expect(current_path).to eq("/surgeries/#{@surgery_1.id}")
    end

    describe 'As a visitor on the show page' do
      before :each do
        visit "/surgeries/#{@surgery_1.id}"
      end

      it "I can see the title and operating room number of that surgery" do
        expect(page).to have_content(@surgery_1.title)
        expect(page).to have_content(@surgery_1.operating_room_number)
      end

      it "I can see other surgeries happening that same day" do
        expect(page).to have_link(@surgery_4.title)
        expect(page).to have_link(@surgery_8.title)
        expect(page).to_not have_link(@surgery_7.title)
      end

      it "I can see the doctors for this surgery" do
        expect(page).to have_content(@doctor_1.name)
        expect(page).to have_content(@doctor_4.name)
        expect(page).to have_content(@doctor_3.name)
        expect(page).to_not have_content(@doctor_2.name)
      end

      it "I can see a field with instructions to Add A Doctor To This Surgery" do
        expect(page).to have_button("Add Doctor")
      end
    end
  end
end
