class UserArticleSubCategory < ActiveRecord::Base
	has_many :articles 
	belongs_to :user_article_category
	belongs_to :article_sub_category

    delegate :name, :to => :article_sub_category, :prefix => true
  
    validates :user_article_category_id, :article_sub_category_id, presence: true
  
 	def permitted_params
  		params.require(:user_article_sub_category).permit(:user_article_category_id, :article_sub_category_id)
  	end

  	def to_s
   		article_sub_category.name
  	end
end
