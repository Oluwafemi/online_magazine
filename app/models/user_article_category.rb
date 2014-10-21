class UserArticleCategory < ActiveRecord::Base
  has_many :articles#, :dependent => :destroy
  has_many :user_article_sub_categories
  
  belongs_to :admin_user
  belongs_to :article_category

  delegate :name, :to => :article_category, :prefix => true
  
  validates :admin_user_id, :article_category_id, presence: true

  after_create :create_user_sub_categories
  
  def permitted_params
  	params.require(:user_article_category).permit(:admin_user_id, :article_category_id, :enabled)
  end

  def create_user_sub_categories
    article_category.article_sub_category_ids.each do |sub_category_id|
      UserArticleSubCategory.create(:user_article_category_id => self.id, :article_sub_category_id => sub_category_id)
    end
  end

  def to_s
    article_category.name
  end

  def creator
    admin_user
  end

  def creator_name
    admin_user.full_name
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

  def self.current_sub_categories(instance_id)
    find(instance_id).user_article_sub_categories
  end

end