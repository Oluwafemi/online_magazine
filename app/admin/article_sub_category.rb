ActiveAdmin.register ArticleSubCategory do
  #belongs_to :article_category
  actions :all, :except => [:destroy]
  permit_params :title, :article_category_id, :allow_readers_comment, :active
  #navigation_menu :article_category
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :title
    column :article_category
    column :allow_readers_comment
    column :active
    column do |sub_category|
      link_to("Details", admin_article_sub_category_path(sub_category)) + " | " + \
      link_to("Edit", edit_admin_article_sub_category_path(sub_category))
    end
  end

  show :title => :title do
    attributes_table do
      row :title
      row :article_category
      row :allow_readers_comment
      row :active
      row :created_at
    end
    active_admin_comments
  end
end
