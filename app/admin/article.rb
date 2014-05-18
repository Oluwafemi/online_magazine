ActiveAdmin.register Article do
  actions :all, :except => [:destroy]
  scope_to :current_admin_user, :association_method => :current_articles
  form :partial => "form"

  controller do
    def permitted_params
      params.permit article: [:title, :user_article_category_id, :introduction, :created_at, :updated_at,
        :body, :reviewed]
    end    
  end

  show :title => :title do |article|
    attributes_table do 
      row :title
      row :article_category_name
      row :introduction
      row :created_at
      row :updated_at
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
  
end