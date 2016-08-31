class CreateUbikes < ActiveRecord::Migration
  def change
    create_table :ubikes do |t|
      t.string :ubike_id
      t.string :name
      t.timestamps null: false
    end
  end
end
