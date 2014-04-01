ActiveAdmin.register Article do
  actions :all, :except => [:destroy]
  scope_to :current_admin_user, :association_method => :current_articles

  controller do
    def permitted_params
      params.permit article: [:title, :user_article_category_id, :introduction, :created_at, :updated_at, :image,
        :image_cache, :img_url, :body, :reviewed]
    end    
  end

  show :title => :title do |article|
    attributes_table do 
      row :title
      row :article_category_name
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
      cat = article.user_article_category.article_category
      link_to cat.name, '#'
    end
    column :reviewed if current_admin_user.superuser
    column "Creator" do |article|
      admin = article.user_article_category.admin_user
      link_to admin.email, '#' #admin_admin_user_path(admin)
    end
    column :created_at
    column do |art|
      if current_admin_user.superuser
        delete = " | " + link_to("Delete", admin_article_path(art), :method => :delete, :confirm => "Are you sure?")      
        link_to("View", admin_article_path(art)) + " | " + \
        link_to("Edit", edit_admin_article_path(art)) + delete.try(:html_safe)
      else
        delete = link_to("View", admin_article_path(art)) + " | " + \
        link_to("Edit", edit_admin_article_path(art)) + delete.try(:html_safe)
      end
    end
  end

  filter :title 
  filter :created_at
  filter :updated_at

  form(:html => { :multipart => true }) do |f|
    f.inputs "Article Details" do
      f.input :title
      f.input :introduction
      if f.object.persisted?
        f.input :user_article_category, :label => "Select Article Category", :include_blank => false, 
          :as => :select, :collection => current_admin_user.current_article_categories
      else
        f.input :user_article_category, :label => "Select Article Category", 
          :include_blank => "choose article category", :as => :select, :collection => current_admin_user.current_article_categories
      end
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.user_thumb.to_s)
      #f.input :remove_image, :as => :boolean
      f.input :body, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400, :toolbar => 'Full' } }
    end
    f.actions
  end
  
end