class AddAddressToLunches < ActiveRecord::Migration
  def change
    add_column :lunches, :street, :string
    add_column :lunches, :city, :string
    add_column :lunches, :state, :string
    add_column :lunches, :zipcode, :integer
  end
end
