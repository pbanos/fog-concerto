module Fog
	module Concerto
		class Compute
			class ServerPlan < Fog::Model
				identity :id
				attribute :name
				attribute :memory
				attribute :cpus
				attribute :storage
				attribute :location_id
				attribute :cloud_provider_id

				def location
					@location ||= service.locations.get(location_id) if location_id
				end

				def cloud_provider
					@cloud_provider ||= service.cloud_providers.get(cloud_provider_id) if cloud_provider_id
				end
			end
		end
	end
end