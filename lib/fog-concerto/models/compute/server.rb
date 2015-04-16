require 'fog/compute/models/server'

module Fog
	module Concerto
		class Compute
			class Server < Fog::Compute::Server
				identity :id
				attribute :name
				attribute :fqdn
				attribute :state
				attribute :public_ip
				attribute :workspace_id
				attribute :template_id
				attribute :server_plan_id
				attribute :ssh_profile_id

				def initialize(attributes = {})
					self.workspace = attributes.delete(:workspace)
					self.template = attributes.delete(:template)
					self.server_plan = attributes.delete(:server_plan)
					super
				end

				def workspace=(workspace)
					@workspace = workspace
					if workspace
						self.workspace_id = workspace.id
					else
						self.workspace_id = nil
					end
				end

				def workspace
					@workspace ||= service.workspaces.get(workspace_id) if workspace_id
				end

				def template=(template)
					@template = template
					if template
						self.template_id = template.id
					else
						self.template_id = nil
					end
				end

				def template
					@template ||= service.templates.get(template_id) if template_id
				end

				def server_plan=(server_plan)
					@server_plan = server_plan
					if server_plan
						self.server_plan_id = server_plan.id
					else
						self.server_plan_id = nil
					end
				end

				def server_plan
					@server_plan ||= service.server_plans.get(server_plan_id) if server_plan_id
				end

				def ssh_profile
					@ssh_profile ||= service.ssh_profiles.get(ssh_profile_id) if ssh_profile_id
				end

				def destroy
					requires :id
					data = service.delete_server(id).body
					merge_attributes(data)
				end

				def save
					requires :name, :fqdn, :workspace_id, :template_id, :server_plan_id
					if id
						data = service.update_server(id, name, fqdn).body
						merge_attributes(data)
					else
						data = service.create_server(name, fqdn, workspace_id, template_id, server_plan_id).body
						merge_attributes(data)
					end
				end

				def start
					requires :id
					data = service.boot_server(id).body
					merge_attributes(data)
				end

				def stop
					requires :id
					data = service.shutdown_server(id).body
					merge_attributes(data)
				end

				def reboot
					requires :id
					data = service.reboot_server(id).body
					merge_attributes(data)
				end

				def override
					requires :id
					data = service.override_server(id).body
					merge_attributes(data)
				end

				def ready?
					state == 'operational'
				end
			end
		end
	end
end