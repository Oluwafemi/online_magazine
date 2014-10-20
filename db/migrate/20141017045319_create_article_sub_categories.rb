class CreateArticleSubCategories < ActiveRecord::Migration
  def change
    create_table :article_sub_categories do |t|
      t.string :title
      t.references :article_category, :null => false
      t.boolean :allow_readers_comment, :null => false, :default => false
      t.boolean :active, :null => false, :default => true
            
      t.timestamps
    end
    add_foreign_key(:article_sub_categories, :article_categories, dependent: :destroy)  #:nullify
    add_index :article_sub_categories, [:title, :article_category_id], :unique => true, :name => 'article_article_sub_idx'
  end
end