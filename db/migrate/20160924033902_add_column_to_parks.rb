class AddColumnToParks < ActiveRecord::Migration
  def change
    add_column :parks,:wgsx ,:float
    add_column :parks,:wgsy ,:float
  end
end
