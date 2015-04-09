require 'fog/core/collection'
require 'fog-concerto/models/compute/workspace'

module Fog
	module Concerto
		class Compute
			class Workspaces < Fog::Collection
				model Fog::Compute::Concerto::Workspace

				def all
					data = service.list_workspaces.body
					load(data)
				end

				def get(id)
					data = service.get_workspace(id).body
					new(data)
				end
			end
		end
	end
end