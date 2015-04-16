require 'fog/core/collection'
require 'fog-concerto/models/compute/server_plan'

module Fog
	module Concerto
		class Compute
			class ServerPlans < Fog::Collection
				model Fog::Compute::Concerto::ServerPlan
				attribute :cloud_provider_id

				def all
					requires :cloud_provider_id
					data = service.list_server_plans(cloud_provider_id).body
					load(data)
				end

				def get(id)
					data =  service.get_server_plan(id).body
					new(data)
				end
			end
		end
	end
end