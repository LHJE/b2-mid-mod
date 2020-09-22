class AddColumnsToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :specialty, :string
    add_column :doctors, :university, :string
  end
end
