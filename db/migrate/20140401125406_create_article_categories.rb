class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name
      t.boolean :allow_readers_comment, :null => false, :default => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
