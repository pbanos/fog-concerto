require 'fog/core/collection'
require 'fog-concerto/models/compute/domain'

module Fog
	module Concerto
		class Compute
			class Domains < Fog::Collection
				model Fog::Compute::Concerto::Domain

				def all
					data = service.list_domains.body
					load(data)
				end

				def get(id)
					data = service.get_domain(id).body
					new(data)
				end
			end
		end
	end
end