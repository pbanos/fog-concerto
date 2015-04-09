require 'fog/core/collection'
require 'fog-concerto/models/compute/generic_image'

module Fog
	module Concerto
		class Compute
			class GenericImages < Fog::Collection
				model Fog::Compute::Concerto::GenericImage

				def all
					data = service.list_generic_images.body
					load(data)
				end

				def get(id)
					all.detect{|generic_image| generic_image.id == id}
				end
			end
		end
	end
end