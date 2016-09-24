class ChangeColumnTypeForPart < ActiveRecord::Migration
  def change
    remove_column :parks,:wgsx
    remove_column :parks,:wgsy
  end
end
