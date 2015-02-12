class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :file
      t.integer :dive_id, index: true

      t.timestamps null: false
    end
  end
end
