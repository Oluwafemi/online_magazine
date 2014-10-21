class AdminUser < ActiveRecord::Base
  
  has_many :user_article_categories, :dependent => :destroy
  has_many :article_categories, :through => :user_article_categories
  has_many :articles, :through => :user_article_categories

  accepts_nested_attributes_for :user_article_categories, :allow_destroy => true
    
  after_create { |admin| admin.send_reset_password_instructions }
   
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  before_validation :normalize_full_names, on: [:create, :update]

  validates :first_name, :last_name, :email, presence: true

  def admin_user_params 
    params.require(:admin_user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :superuser)
  end
  
  def password_required?
    new_record? ? false : super
  end

  def current_article_categories
    user_article_categories.user_current_article_categories
  end

  def current_active_categories
    user_article_categories.user_current_active_categories
  end

  def current_articles
    if superuser
      Article.order_by_updated_at
    else
      articles.order_by_updated_at
    end
  end

  def current_title
    email
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  protected
    def normalize_full_names
      self.first_name = self.first_name.downcase.titleize
      self.last_name = self.last_name.downcase.titleize
    end

end
