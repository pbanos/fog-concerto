module Fog
	module Concerto
		class Compute
			class FirewallProfile < Fog::Model
				identity :id
				attribute :name
				attribute :description
				attribute :default
				attribute :rules

				def destroy
					requires :id
					service.delete_firewall_profile(id).body
				end

				def save
					requires :name, :description
					if id
						data = service.update_firewall_profile(id, name, description, rules).body
						merge_attributes(data)
					else
						data = service.create_firewall_profile(name, description, rules).body
						merge_attributes(data)
					end
				end
			end
		end
	end
end