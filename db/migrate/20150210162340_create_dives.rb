class CreateDives < ActiveRecord::Migration
  def change
    create_table :dives do |t|
      t.integer :user_id, index: true
      t.integer :divesite_id, index: true
      t.datetime :date

      t.timestamps null: false
    end
  end
end
