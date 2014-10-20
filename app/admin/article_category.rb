ActiveAdmin.register ArticleCategory do
  actions :all, :except => [:destroy]
  permit_params :name, :allow_readers_comment, :active

  #sidebar "Sub Categories", only: [:show, :edit] do |article_category|
  #  ul do |article_sub_category|
  #    li link_to "Sub Categories", admin_article_category_article_sub_category_path(article_category, article_sub_category)

  # end
  #end
  
  controller do
    
    def action_methods
      if current_admin_user.superuser
        super
      end
    end

    #def create
    #  @article_category = ArticleCategory.new(permitted_params[:article_category])
    #  if @article_category.save
    #    redirect_to admin_article_categories_path
    #  else
    #    render :new
    #  end
    #end    

  end

  menu :if => proc{ current_admin_user.superuser }
  #action_item :only => [:edit], :if => proc { current_admin_user.superuser } do

  show :title => :name do |article_category|
    attributes_table do 
      row :name
      row :allow_readers_comment
      row :active
      row :created_at
      row :updated_at
      row 'Sub Categories' do
        article_category.current_sub_categories.map { |sub_category| "<a href='" + admin_article_sub_category_path(sub_category) + "'>" + sub_category.title + "</a>" }.join("<br /><br />").html_safe
      end
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
    link_to("Edit", edit_admin_article_category_path(article_catr))# + delete.try(:html_safe)
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