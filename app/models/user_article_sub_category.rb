class UserArticleSubCategory < ActiveRecord::Base
	has_many :articles 
	belongs_to :user_article_category
	belongs_to :article_sub_category

  validates :user_article_category_id, :article_sub_category_id, presence: true
  
 	def permitted_params
    params.require(:user_article_sub_category).permit(:user_article_category_id, :article_sub_category_id)
  end

  def sub_category_name
    to_s
  end

  def title
    to_s
  end

  def to_s
    article_sub_category.title
  end

end
