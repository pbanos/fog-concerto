module Fog
	module Concerto
		class Compute
			class CloudProvider < Fog::Model
				identity :id
				attribute :name
				attribute :provided_services

				def server_plans
					requires :id
					service.server_plans(:cloud_provider_id => id)
				end
			end
		end
	end
end