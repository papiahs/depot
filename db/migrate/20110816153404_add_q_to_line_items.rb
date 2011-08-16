class AddQToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :q, :integer, :default=>1
  end

  def self.down
    remove_column :line_items, :q
  end
end
