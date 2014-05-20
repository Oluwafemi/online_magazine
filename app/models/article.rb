# require 'carrierwave/orm/activerecord'

class Article < ActiveRecord::Base
    belongs_to :user_article_category 

    validates :title, :image, :introduction, :user_article_category_id, :body, :presence => true
    validates :introduction, :length => { :in => 100..200 }
    validates :body, :length => { :in => 500..2500 }

    delegate :article_category_name, :to => :user_article_category

    mount_uploader :image, ImageUploader
  
    def self.order_by_updated_at
        order('updated_at DESC')
    end

    def permitted_params
        params.require(:article).permit(:title, :user_article_category_id, :introduction, :created_at, :updated_at, :image,
            :image_cache, :img_url, :body, :reviewed)
    end
end