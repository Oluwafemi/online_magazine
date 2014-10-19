class AddIndexToArticleCategories < ActiveRecord::Migration
  def change
  	add_index :article_categories, [:name], :unique => true, :name => 'article_cat_name'
  end
end
