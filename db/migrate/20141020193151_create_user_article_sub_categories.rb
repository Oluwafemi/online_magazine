class CreateUserArticleSubCategories < ActiveRecord::Migration
  def change
    create_table :user_article_sub_categories do |t|
      t.references :user_article_category, :null => false
      t.references :article_sub_category, :null => false
      t.timestamps
    end
    add_foreign_key(:user_article_sub_categories, :user_article_categories, dependent: :destroy)
    add_foreign_key(:user_article_sub_categories, :article_sub_categories, dependent: :destroy)
  end
end
