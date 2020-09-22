class CreateDoctor < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.references :hospital, foreign_key: true
      
      t.timestamps
    end
  end
end
