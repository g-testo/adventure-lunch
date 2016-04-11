class RemoveAuthorFromReview < ActiveRecord::Migration
  def down
    remove_column :reviews, :author
  end
end
