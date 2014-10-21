ActiveAdmin.register Article do
  #actions :all, :except => [:destroy]
  scope_to :current_admin_user, :association_method => :current_articles
  form :partial => "form"
  permit_params :title, :user_article_category_id, :user_article_sub_category_id, :introduction, :created_at, :updated_at, :image,
        :image_cache, :img_url, :body, :reviewed

  #controller do   end

  show :title => :title do |article|
    attributes_table do 
      row :title
      row :article_category_name
      row :article_sub_category_name
      row :introduction
      row :created_at
      row :updated_at
      row :image do
        image_tag(article.image.to_s)
      end
    end
    active_admin_comments
  end

  index do
    column :title
    column "Article Category" do |article|
      article_category = article.user_article_category.article_category
      link_to article_category.name, admin_article_category_path(article_category)
    end
    column :reviewed if current_admin_user.superuser
    column "Article Creator" do |article|
      admin_user = 
      link_to article.creator_name, admin_admin_user_path(article.creator)
    end
    column :created_at
    column do |art|
      if current_admin_user.superuser
        delete = " | " + link_to("Delete", admin_article_path(art), :method => :delete, :confirm => "Are you sure?")      
        link_to("View", admin_article_path(art)) + " | " + \
        link_to("Edit", edit_admin_article_path(art)) + delete.try(:html_safe)
      else
        delete = link_to("View", admin_article_path(art)) + " | " + \
        link_to("Edit", edit_admin_article_path(art))# + delete.try(:html_safe)
      end
    end
  end

  filter :title 
  filter :created_at
  filter :updated_at
  
end