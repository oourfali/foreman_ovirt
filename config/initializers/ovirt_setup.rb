# Requiring the foreman_ovirt bundler group
Bundler.require(:foreman_ovirt)

# Add permissions
Foreman::AccessControl.map do |map|
  map.security_block :ovirt do |map|
    map.permission :view_ovirt, { 'foreman_ovirt/hosts' => [:show, :show_graphs],
                                  'foreman_ovirt/dashboard' => [:index] }
  end
end

# Add a new role called 'oVirt' if it doesn't exist
Role.transaction do
  ovirt_role = Role.find_or_create_by_name("Ovirt")
  if ovirt_role.permissions.empty?
    ovirt_role.update_attribute :permissions, [:view_ovirt]
  end
end
#require 'foreman_ovirt/auth_source_ovirt'
# Adding an oVirt authentication source for all the oVirt compute resources
User.current = User.admin
ForemanOvirt::AuthSourceOvirt.transaction do
	Foreman::Model::Ovirt.unscoped.all.each do |compute_resource|
  		name = compute_resource.name
  		next if ForemanOvirt::AuthSourceOvirt.find_by_name(name)
  		url = URI(compute_resource.url)
  		tls = url.scheme == "https" ? true : false
  		ForemanOvirt::AuthSourceOvirt.create(:name => name, :host => url.host, :port => url.port, :onthefly_register => true, :tls => tls)
	end
end
