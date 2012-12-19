module ForemanOvirt
  module UserExtensions
    extend ActiveSupport::Concern
      included do
        after_save :add_role_to_user
	end

	module InstanceMethods
    	def add_role_to_user
        user_auth_source = AuthSource.find(auth_source)
    		if (user_auth_source && user_auth_source.type == "AuthSourceOvirt")
          #if auth_source is ovirt
          ovirt_role_id = Role.find_by_name("Ovirt").id
          if (!user_roles.find_by_role_id(ovirt_role_id))
            puts ovirt_role_id
            user_roles.create(:role_id => ovirt_role_id)
            puts "add_role_to_user"
          end
        end
    	end
    end
  end
end
# Add Ovirt role to ovirt user
User.send :include, ForemanOvirt::UserExtensions
