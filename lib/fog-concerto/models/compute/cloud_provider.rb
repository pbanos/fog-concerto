module Fog
	module Concerto
		class Compute
			class CloudProvider < Fog::Model
				identity :id
				attribute :name
				attribute :required_credentials
				attribute :provided_services
			end
		end
	end
end