class UserArticleCategory < ActiveRecord::Base
  has_many :articles#, :dependent => :destroy
  
  belongs_to :admin_user
  belongs_to :article_category

  delegate :name, :to => :article_category, :prefix => true
  
  validates :admin_user_id, :article_category_id, :presence => true
  
  def permitted_params
  	params.require(:user_article_category).permit(:admin_user_id, :article_category_id, :enabled)
  end

  def to_s
    article_category.name
  end

  def self.user_current_article_categories
    user_user_article_categories = where("enabled = true")
    user_article_categories = user_user_article_categories.map { |user_art| user_art.article_category }
  end

  def self.user_current_active_categories
    user_user_article_categories = where("enabled = true")
    user_article_categories = user_user_article_categories.select { |art| art.currently_active_article_category }
  end

  def currently_active_article_category
    article_category.currently_active
  end

end