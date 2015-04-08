require 'fog/core/collection'
require 'fog-concerto/models/compute/firewall_profile'

module Fog
	module Concerto
		class Compute
			class FirewallProfiles < Fog::Collection
				model Fog::Compute::Concerto::FirewallProfile

				def all
					data = service.list_firewall_profiles.body
					load(data)
				end

				def get(id)
					data = service.get_firewall_profile(id).body
					new(data)
				end
			end
		end
	end
end