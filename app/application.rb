require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = [
          { :label => "Dashboard", :action => '/app', 
            :reload => true, :web_bkg_color => 0x7F7F7F }, 
          { :label => "Post",  :action => '/app/Post'},
          { :label => "Setting",   :action => '/app/Settings'}
        ]
    #To remove default toolbar uncomment next line:
    #@@toolbar = nil
    super
    

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    # SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
    # SyncEngine.enable_status_popup(false)
  end
  
  # def on_ui_created
  #   render :action => "/app/Post"
  # end
  # 
  # def on_ui_destroyed
  #   
  # end
  # 
  # def on_activate_app
  #   render :action => "/app/Post"
  #   puts "on_activate_app"
  # end
  # 
  # def on_deactivate_app
  #   
  # end
  
end
