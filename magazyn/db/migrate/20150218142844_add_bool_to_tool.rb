class AddBoolToTool < ActiveRecord::Migration
  def change
    add_column :tools, :active, :boolean, default: true
  end
end
