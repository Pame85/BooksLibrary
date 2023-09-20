class ReviewsBook < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :title
      t.text :content
      t.integer :book_id
      t.integer :score
      t.boolean :recommended, default: false
      t.timestamps
    end
  end
end
