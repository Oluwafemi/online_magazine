class StaticPagesController < ApplicationController
  def home
  	@article_categories = ArticleCategory.active_article_categories
  end

  def contact
  end
end
