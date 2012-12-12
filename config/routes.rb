Rails.application.routes.draw do

  constraints(:id => /[^\/]+/) do
    get "hosts/:id/ovirt" => "foreman_ovirt/hosts#show"
    get "hosts/:id/graphs/ovirt" => "foreman_ovirt/hosts#show_graphs"
  end

  resources :auth_source_ovirts
  get "dashboard/ovirt" => "foreman_ovirt/dashboard#index"
end
