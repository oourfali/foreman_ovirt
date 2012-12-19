module ForemanOvirt
  class DashboardController < ::DashboardController

    layout 'layouts/application_ovirt'

    def index
      render :action => 'dashboard/index'
    end
  end
end
