module ForemanOvirt
  module UserExtensions
    extend ActiveSupport::Concern
      included do
        after_save :add_role_to_user
	end

	module InstanceMethods
    	def add_role_to_user
        logger.debug "add_role_to_user started"
        user_auth_source = AuthSource.find(auth_source)
        logger.debug "auth source is: " + user_auth_source.type
	if (user_auth_source && user_auth_source.type == "ForemanOvirt::AuthSourceOvirt")
          # Checking auth_source is oVirt
          ovirt_role_id = Role.find_by_name("Ovirt").id
          if (!user_roles.find_by_role_id(ovirt_role_id))
            logger.debug "adding oVirt role to user " + name
            user_roles.create(:role_id => ovirt_role_id)
          end
        end
      end
    end
  end
end
# Add Ovirt role to ovirt user
User.send :include, ForemanOvirt::UserExtensions
