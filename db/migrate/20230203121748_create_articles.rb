class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :category
      t.string :body
      t.date :date_published
      t.timestamps
    end
  end
end
