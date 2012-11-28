Imls::Application.routes.draw do
  root :to => "catalog#index"

  Blacklight.add_routes(self)

  # override some blacklight routes
  # to handle IDs that include periods
  get '/catalog/:*id', :format => false, :as => 'solr_document', :to => 'catalog#show'
  get '/catalog/:*id', :format => false, :as => 'catalog', :to => 'catalog#show'
  put '/catalog/:*id', :format => false, :as => 'solr_document', :to => 'catalog#update'
  put '/catalog/:*id', :format => false, :as => 'catalog', :to => 'catalog#update'

  match '/catalog/:*id/librarian_view(.:format)', :as => 'librarian_view_catalog', :to => 'catalog#librarian_view'
  devise_for :users

end
