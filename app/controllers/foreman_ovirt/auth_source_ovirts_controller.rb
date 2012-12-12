class AuthSourceOvirtsController < ApplicationController
  layout 'layouts/application_ovirt'
  skip_before_filter :verify_authenticity_token
  def index
    @auth_source_ovirts = AuthSourceOvirt.all
    respond_to do |format|
      format.html { }
      format.json { render :json => @auth_source_ovirts }
    end
  end

  def show
    @auth_source_ovirt = AuthSourceOvirt.find(params[:id])
    respond_to do |format|
      format.html { }
      format.json { render :json => @auth_source_ovirt }
    end
  end

  def new
    @auth_source_ovirt = AuthSourceOvirt.new
  end

  def create
    @auth_source_ovirt = AuthSourceOvirt.new(params[:auth_source_ovirt])
    if @auth_source_ovirt.save
      process_success
    else
      process_error
    end
  end

  def edit
    @auth_source_ovirt = AuthSourceOvirt.find(params[:id])
  end

  def update
    @auth_source_ovirt = AuthSourceOvirt.find(params[:id])
    if @auth_source_ovirt.update_attributes(params[:auth_source_ovirt])
      process_success
    else
      process_error
    end
  end

  def destroy
    @auth_source_ovirt = AuthSourceOvirt.find(params[:id])
    if @auth_source_ovirt.destroy
      process_success
    else
      process_error
    end

  end
end
