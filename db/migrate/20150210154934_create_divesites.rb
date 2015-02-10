class CreateDivesites < ActiveRecord::Migration
  def change
    create_table :divesites do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
