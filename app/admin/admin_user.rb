ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  actions :all, :except => [:destroy]

  show :title => :current_title do
    attributes_table do
      row :email
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
      row :superuser
      row 'Enabled Article Categories' do |n| #(&:name)
        AdminUser.find(params[:id]).current_article_categories.map { |art| art.name }.join("<br /><br />").html_safe
      end 
    end
    active_admin_comments
  end
  
  controller do
    
    def action_methods
      if current_admin_user.superuser
        super
      end
    end

    def create
      admin = AdminUser.create(:email => params[:admin_user][:email], :superuser => params[:admin_user][:superuser])
      if admin.valid?
        cats = params[:admin_user][:article_category_ids] - [""]
        cats.each do |id|
          UserArticleCategory.create(:admin_user_id => admin.id, :article_category_id => id.to_i, :enabled => true)
        end
        redirect_to :action => :index
      else
        redirect_to :action => :new
      end
    end
    
    def update
      admin = AdminUser.find(params[:id])
      admin.email = params[:admin_user][:email]
      
      if admin.id != current_admin_user.id
        admin.superuser = params[:admin_user][:superuser]
      end
            
      if admin.save        
        a1 = params[:admin_user][:current_article_categories] - [""]
        a1.map! {|c| c.to_i }
        a2 = admin.user_article_categories.where(:enabled => true).map { |c| c.article_category_id }
        a3 = admin.user_article_categories.where(:enabled => false).map { |c| c.article_category_id }
        
        a4 = a1 - a2 - a3 
        #render :text => "#{a4}"
        a4.each do |id|
          admin.user_article_categories.create(:article_category_id => id, :enabled => true)
        end        
        
        a4 = a2 - a1
        a4.each do |id|
          ActiveRecord::Base.connection.execute("UPDATE user_article_categories SET enabled = false \
            WHERE article_category_id = #{id} AND admin_user_id = #{admin.id}")
        end
        
        a4 = a1 & a3
        a4.each do |id|
          ActiveRecord::Base.connection.execute("UPDATE user_article_categories SET enabled = true \
            WHERE article_category_id = #{id} AND admin_user_id = #{admin.id}")
        end 
        redirect_to :action => :show
      else
        admin.valid?
        redirect_to :action => :edit
      end

    end
  
  end
  
  menu :if => proc{ current_admin_user.superuser }

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :superuser
    column do |user|
      if user.encrypted_password == ''
        delete = link_to("Details", admin_admin_user_path(user)) + delete.try(:html_safe)
      else
        delete = " | " + link_to("Delete", admin_admin_user_path(user), :method => :delete, :confirm => "Are you sure?") unless current_admin_user == user
      
        link_to("Details", admin_admin_user_path(user)) + " | " + \
        link_to("Edit", edit_admin_admin_user_path(user)) + delete.try(:html_safe)
      end
    end
  end
  
  filter :email
  filter :superuser
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :sign_in_count

  form do |f|
    if f.object.persisted?
      f.inputs do  
        f.input :email
        if current_admin_user.id != f.object.id
          f.input :superuser, :label => "Super User Priveleges" 
        end
        f.input :current_article_categories, :as => :check_boxes, :multiple => true, :collection => ArticleCategory.all, :required => false
      end
    else
      f.inputs do
        f.input :email 
        f.input :superuser, :label => "Super User Priveleges" 
        f.input :article_categories, :as => :check_boxes, :multiple => true, :collection => ArticleCategory.all, :required => false      
      end
    end
    f.actions
  end

end

# login wit auth providers twitter, facebook, google+
# works like this from our app, the user goes to the auth provider to login
# current_user.authentications.find_or_create_by_provder_and_uid(auth['provider'], auth['uid'])  
# menu :priority => 1  #config.clear_action_items!

  

  