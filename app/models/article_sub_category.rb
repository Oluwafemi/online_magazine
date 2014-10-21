class ArticleSubCategory < ActiveRecord::Base
	  belongs_to :article_category
    has_many :user_article_sub_categories
    has_many :articles, :through => :user_article_sub_categories

    validates :title, presence: true, uniqueness: true, length: { :in => 1..18 }

    validates :article_category_id, presence: true
    
    before_validation :normalize_title, on: [:create, :update]

    after_create :create_user_sub_categories
 
    def self.active_article_sub_categories
    	where('active = TRUE')
    end

    def currently_active
    	active
	  end

    def create_user_sub_categories
      article_category.user_article_category_ids.each do |user_category_id|
      UserArticleSubCategory.create(:user_article_category_id => user_category_id, :article_sub_category_id => self.id)
    end
  end

    protected
    	def normalize_title
      		self.title = self.title.upcase unless self.title.nil?
      	end

  	private

    	def permitted_params
      		params.require(:article_sub_category).permit(:title, :article_category_id, :allow_readers_comment, :active)
    	end
end
