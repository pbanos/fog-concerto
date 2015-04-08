require 'fog/core/collection'
require 'fog-concerto/models/compute/cloud_provider'

module Fog
	module Concerto
		class Compute
			class CloudProviders < Fog::Collection
				model Fog::Compute::Concerto::CloudProvider

				def all
					data = service.list_cloud_providers.body
					load(data)
				end

				def get(id)
					data = service.get_cloud_provider(id).body
					new(data)
				end
			end
		end
	end
end