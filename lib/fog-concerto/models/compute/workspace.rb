require 'fog/core/model'

module Fog
	module Concerto
		class Compute
			class Workspace < Fog::Model
				identity :id
				attribute :name
				attribute :default
				attribute :domain_id
				attribute :firewall_profile_id
				attribute :ssh_profile_id

				def initialize(attributes = {})
					self.domain = attributes.delete(:domain)
					self.firewall_profile = attributes.delete(:firewall_profile)
					self.ssh_profile = attributes.delete(:ssh_profile)
					super
				end

				def domain=(domain)
					@domain = domain
					if domain
						self.domain_id = domain.id
					else
						self.domain_id = nil
					end
				end

				def domain
					@domain ||= service.domains.get(domain_id) if domain_id
				end

				def firewall_profile=(firewall_profile)
					@firewall_profile = firewall_profile
					if firewall_profile
						self.firewall_profile_id = firewall_profile.id
					else
						self.firewall_profile_id = nil
					end
				end

				def firewall_profile
					@firewall_profile ||= service.firewall_profiles.get(firewall_profile_id) if firewall_profile_id
				end

				def ssh_profile=(ssh_profile)
					@ssh_profile = ssh_profile
					if ssh_profile
						self.ssh_profile_id = ssh_profile.id
					else
						self.ssh_profile_id = nil
					end
				end

				def ssh_profile
					@ssh_profile ||= service.ssh_profiles.get(ssh_profile_id) if ssh_profile_id
				end

				def servers
					requires :id
					service.servers(:workspace_id => id)
				end

				def destroy
					requires :id
					service.delete_workspace(id).body
				end

				def save
					requires :name, :domain_id, :firewall_profile_id, :ssh_profile_id
					if id
						data = service.update_workspace(id, name, domain_id, ssh_profile_id, firewall_profile_id).body
						merge_attributes(data)
					else
						data = service.create_workspace(name, domain_id, ssh_profile_id, firewall_profile_id).body
						merge_attributes(data)
					end
				end
			end
		end
	end
end