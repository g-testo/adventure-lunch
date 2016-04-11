class AddAuthorToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :author, :integer
  end
end
