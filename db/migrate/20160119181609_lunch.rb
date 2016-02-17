class Lunch < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :name
      
      t.timestamps null: false
    end
  end
end


