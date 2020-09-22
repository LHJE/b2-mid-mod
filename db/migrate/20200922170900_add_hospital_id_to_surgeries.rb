class AddHospitalIdToSurgeries < ActiveRecord::Migration[5.2]
  def change
    add_reference :surgeries, :hospital, foreign_key: true
  end
end
