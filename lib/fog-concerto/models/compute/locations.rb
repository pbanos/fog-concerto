require 'fog/core/collection'
require 'fog-concerto/models/compute/location'

module Fog
	module Concerto
		class Compute
			class Locations < Fog::Collection
				model Fog::Compute::Concerto::Location

				def all
					data = service.list_locations.body
					load(data)
				end

				def get(id)
					all.detect{|location| location.id == id}
				end
			end
		end
	end
end