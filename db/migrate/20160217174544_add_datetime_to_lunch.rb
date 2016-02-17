class AddDatetimeToLunch < ActiveRecord::Migration
  def change
    add_column :lunches, :date, :datetime
  end
end
