module ForemanOvirt
  class HostsController < ::HostsController

    skip_before_filter :verify_authenticity_token
    layout 'layouts/application_ovirt'

    def show
      super
    end

    def show_graphs
      @host        = ::Host.find_by_name(params[:id])
      show
    end

 end
end
