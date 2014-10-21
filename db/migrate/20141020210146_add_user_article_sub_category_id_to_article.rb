class AddUserArticleSubCategoryIdToArticle < ActiveRecord::Migration
  def change
  	change_table :articles do |t|
  		t.references :user_article_sub_category
  	end
    add_foreign_key(:articles, :user_article_sub_categories, dependent: :destroy)
  end
end
