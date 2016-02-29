class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.string :body
      t.integer :swords
      t.belongs_to :lunch, index: true

      t.timestamps null: false
    end
  end
end
