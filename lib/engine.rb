module ForemanOvirt
  class Engine < ::Rails::Engine

  		config.to_prepare do
			User.send :include, ForemanOvirt::UserExtensions
  		end
  end
end

