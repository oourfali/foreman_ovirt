Rails.application.routes.draw do

  constraints(:id => /[^\/]+/) do
    # Special show host for oVirt
    get "hosts/:id/ovirt" => "foreman_ovirt/hosts#show"

    # Special show host graphs for oVirt
    get "hosts/:id/graphs/ovirt" => "foreman_ovirt/hosts#show_graphs"
  end

  # auth_source_ovirt resource
  resources :auth_source_ovirts, :controller => "foreman_ovirt/auth_source_ovirts"

  # Special dashboard for oVirt
  get "dashboard/ovirt" => "foreman_ovirt/dashboard#index"
end
