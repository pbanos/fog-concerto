require 'fog/core/collection'
require 'fog-concerto/models/compute/template'

module Fog
	module Concerto
		class Compute
			class Templates < Fog::Collection
				model Fog::Compute::Concerto::Template

				def all
					data = service.list_templates.body
					load(data)
				end

				def get(id)
					data = service.get_template(id).body
					new(data)
				end
			end
		end
	end
end