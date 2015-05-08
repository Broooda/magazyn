class AddTool < ActiveRecord::Migration
  def change
    create_table(:tools) do |t|
      t.string :name
      t.integer :count
      t.string :code
      t.decimal :price 
      t.timestamps

    end
  end
end
