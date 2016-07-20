class RemoveStringFromLunches < ActiveRecord::Migration
  def change
    remove_column :lunches, :string, :string
  end
end
