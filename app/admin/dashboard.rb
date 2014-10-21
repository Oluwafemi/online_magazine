ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      #span class: "blank_slate" do
      #  span I18n.t("active_admin.dashboard_welcome.welcome")
      #  small I18n.t("active_admin.dashboard_welcome.call_to_action")
      #end
    

    # Here is an example of a simple dashboard with columns and panels.
    #
      columns do
        column do
          panel "MOST RECENT ARTICLES" do
            ol do
              Article.order_by_updated_at.limit(20).map do |article|
                li do
                    link_to(article.title, admin_article_path(article)) + " By " +
                    link_to(article.creator_name, admin_admin_user_path(article.creator))
                end
                hr
              end
            end
          end
        end

        column do
          panel "INFO" do
            para "Welcome to SIM Dashboard."
          end
        end
      end
    end
  end # content
end
