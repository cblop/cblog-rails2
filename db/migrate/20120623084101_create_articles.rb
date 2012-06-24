class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :shortUrl
      t.string :tags
      t.boolean :published

      t.timestamps
    end
  end
end
