ActiveAdmin.register ArticleCategory do
  actions :all, :except => [:destroy]
  
  controller do
    def permitted_params
      params.permit article_category: [:name, :allow_readers_comment, :active]
    end

    def action_methods
      if current_admin_user.superuser
        super
      end
    end

  end

  menu :if => proc{ current_admin_user.superuser }
  #action_item :only => [:edit], :if => proc { current_admin_user.superuser } do

  show :title => :name do |article|
    attributes_table do 
      row :name
      row :allow_readers_comment
      row :active
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  index do
    column :name
    column :allow_readers_comment
    column :active
    column do |article_catr|
      delete = " | " + link_to("Delete", admin_article_category_path(article_catr), :method => :delete, :confirm => "Are you sure?") if article_catr.articles.empty?
      
    link_to("Details", admin_article_category_path(article_catr)) + " | " + \
    link_to("Edit", edit_admin_article_category_path(article_catr)) + delete.try(:html_safe)
    end
  end

  form do |f|
    f.inputs "Article Category Details" do
      f.input :name
      f.input :allow_readers_comment
      f.input :active
    end
    f.actions
  end
  
end