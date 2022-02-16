class CreateBooksGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :books_genres do |t|
      t.integer :book_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
