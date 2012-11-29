# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
if Rails::VERSION::MAJOR >= 3
  match 'gitrevision_download/:project_id/:rev', :controller => 'gitrevision_download', :action => 'index', :rev => /[a-z0-9\.\-_]+/, :via => :get
else
  # Tested against Redmine 1.4.5
  ActionController::Routing::Routes.draw do |map|
    map.with_options :controller => 'gitrevision_download' do |grd_routes|
      grd_routes.with_options :conditions => {:method => :get} do |grd_views|
        grd_views.connect 'gitrevision_download', :action => 'index'
      end
      grd_routes.with_options :conditions => {:method => :post} do |grd_views|
        grd_views.connect 'gitrevision_download', :action => 'index'
      end
    end
  end
end

