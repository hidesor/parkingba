class AddColumnToPark < ActiveRecord::Migration
  def change
    add_column :parks,:park_id,:string
  end
end
