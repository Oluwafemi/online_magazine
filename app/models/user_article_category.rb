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
    user_article_categories = []
    user_user_article_categories.each { |user_art| user_article_categories << user_art.article_category }
  end

end