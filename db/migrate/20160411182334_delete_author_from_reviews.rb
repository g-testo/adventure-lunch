class DeleteAuthorFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :author
  end
end
