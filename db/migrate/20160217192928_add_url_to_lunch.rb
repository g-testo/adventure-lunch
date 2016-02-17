class AddUrlToLunch < ActiveRecord::Migration
  def change
    add_column :lunches, :url, :string
  end
end
