class AddSomeColumnToPark < ActiveRecord::Migration
  def change
    add_column :parks,:_id,:string
    add_column :parks,:parkid,:string
    add_column :parks,:areaid,:string
    add_column :parks,:areaname,:string
    add_column :parks,:parkname,:string
    add_column :parks,:introduction,:string
    add_column :parks,:address,:string
    add_column :parks,:totalspace,:string
    add_column :parks,:surplusspace,:string
    add_column :parks,:payguide,:string
    add_column :parks,:updatetime,:string
    add_column :parks,:wgsx,:string
    add_column :parks,:wgsy,:string
  end
end
