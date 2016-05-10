class AddDescriptionToLunch < ActiveRecord::Migration
  def change
    add_column :lunches, :description, :string
  end
end
