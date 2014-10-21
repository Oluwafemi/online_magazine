class ArticleCategory < ActiveRecord::Base
  
  has_many :user_article_categories, :dependent => :destroy
  has_many :admin_users, :through => :user_article_categories
  has_many :articles, :through => :user_article_categories
  has_many :article_sub_categories

  accepts_nested_attributes_for :user_article_categories, :allow_destroy => true

  accepts_nested_attributes_for :article_sub_categories, :allow_destroy => true

  before_validation :normalize_name, on: [:create, :update]
 
  validates :name, presence: true, uniqueness: true, length: { :in => 1..18 }
  # { scope: :year, message: "should happen once per year", case_sensitive: false}
  
  def self.active_article_categories
    where('active = TRUE')
  end

  def currently_active
    active
  end

  def recent_articles
  	articles.order_by_updated_at.limit(20)
  end

  def current_sub_categories
    article_sub_categories.active_article_sub_categories
  end

  def self.sub_category_ids(instance_id)
    find(instance_id).article_sub_category_ids
  end

  protected
    def normalize_name
      #self.name = self.name.downcase.titleize
      self.name = self.name.upcase
    end

  private

    def permitted_params
      params.require(:article_category).permit(:name, :allow_readers_comment, :active)
    end

end