class CreateTakenTool < ActiveRecord::Migration
  def change
    create_table :taken_tools do |t|
      t.integer :tool_id
      t.integer :group_id
      t.integer :count
      t.timestamps
    end
  end
end
