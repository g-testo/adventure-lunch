class AddLunchImageToLunches < ActiveRecord::Migration
  def change
    remove_column :lunches, :lunch_image
    add_column :lunches, :lunch_image, :string
  end
end
