class GoogleMapUrl < ActiveRecord::Migration
  def change
    add_column :parks,:map_address,:string
  end
end
