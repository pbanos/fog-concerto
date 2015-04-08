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
					data = service.list_server_plans.body
					load(data)
				end

				def get(id)
					requires :cloud_provider_id
					all.detect{|server_plan| server_plan.id == id}
				end
			end
		end
	end
end