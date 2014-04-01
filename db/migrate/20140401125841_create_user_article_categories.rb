class CreateUserArticleCategories < ActiveRecord::Migration
  def change
    create_table :user_article_categories do |t|

    t.references :admin_user, :null => false
    t.references :article_category, :null => false
    t.boolean :enabled, :null => false, :default => true
    
    t.timestamps
    end
    
    add_foreign_key(:user_article_categories, :admin_users, dependent: :destroy)
    add_foreign_key(:user_article_categories, :article_categories, dependent: :destroy)
    add_index :user_article_categories, [:admin_user_id, :article_category_id], :unique => true, :name => 'usr_article_cat'
  end
end
