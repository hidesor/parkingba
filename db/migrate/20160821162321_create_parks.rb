class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|

      t.timestamps null: false
    end
  end
end
