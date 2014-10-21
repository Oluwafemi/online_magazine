# require 'carrierwave/orm/activerecord'

class Article < ActiveRecord::Base
    belongs_to :user_article_category 
    belongs_to :user_article_sub_category

    before_validation :normalize_title, on: [:create, :update]

    validates :title, :image, :introduction, :user_article_category_id, :body, :presence => true
    validates :introduction, :length => { :in => 100..200 }
    validates :body, length: {
        minimum: 200,
        maximum: 300,
        tokenizer: lambda { |str| str.scan(/\w+/) },
        too_short: "must have at least %{count} words",
        too_long: "must have at most %{count} words"
    }


    delegate :article_category_name, :to => :user_article_category
    delegate :article_sub_category_name, :to => :user_article_sub_category

    mount_uploader :image, ImageUploader
  
    def self.order_by_updated_at
        order('updated_at DESC')
    end

    def permitted_params
        params.require(:article).permit(:title, :user_article_category_id, :user_article_sub_category_id, :introduction, :created_at, :updated_at, :image,
            :image_cache, :img_url, :body, :reviewed)
    end

    def creator
        user_article_category.creator
    end

    def creator_name
        user_article_category.creator_name
    end

    protected
    
    def normalize_title
      self.title = self.title.upcase
    end
end