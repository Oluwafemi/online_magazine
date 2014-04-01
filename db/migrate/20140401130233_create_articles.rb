class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.text :img_url
      t.references :user_article_category, :null => false
      t.string :introduction, :default => '', :null => false
      t.string :image
      t.boolean :reviewed, :default => false
            
      t.timestamps
    end
    add_foreign_key(:articles, :user_article_categories, dependent: :destroy)  #:nullify
  end
end
