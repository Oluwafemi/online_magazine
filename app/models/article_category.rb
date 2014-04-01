class ArticleCategory < ActiveRecord::Base
  
  has_many :user_article_categories, :dependent => :destroy
  has_many :admin_users, :through => :user_article_categories
  has_many :articles, :through => :user_article_categories

  accepts_nested_attributes_for :user_article_categories, :allow_destroy => true
  validates :name, :presence => true
  
  def self.active_article_categories
    where('active = TRUE')
  end

  def permitted_params
  	params.require(:article_category).permit(:name, :allow_readers_comment, :active)
  end

  def recent_articles
  	articles.order_by_updated_at.limit(4)
  end
end