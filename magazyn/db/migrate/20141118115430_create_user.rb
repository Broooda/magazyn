class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :group_id
      t.timestamps
    end
  end
end
