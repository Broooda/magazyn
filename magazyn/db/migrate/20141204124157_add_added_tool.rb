class AddAddedTool < ActiveRecord::Migration
  def change
    create_table :added_tools do |t|
      t.integer :tool_id
      t.integer :count
      t.timestamps
    end
  end
end
