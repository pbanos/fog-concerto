require 'fog/core/collection'
require 'fog-concerto/models/compute/server'

module Fog
	module Concerto
		class Compute
			class Servers < Fog::Collection
				model Fog::Compute::Concerto::Server
				attribute :workspace_id
				attribute :template_id

				def initialize(attributes)
					if workspace = attributes.delete(:workspace) 
						attributes = attributes.merge(workspace_id: workspace.id) 
					end
					if template_id = attributes.delete(:template) 
						attributes = attributes.merge(template_id: template.id) 
					end
					super(attributes)
				end

				def all(options={})
					requires_one :workspace_id, :template_id
					data = if workspace_id
						service.list_workspace_servers(workspace_id).body
					else
						service.list_template_servers(template_id).body
					end
					load(data)
				end

				def get(id)
					data = service.get_server(id).body
					new(data)
				end
			end
		end
	end
end