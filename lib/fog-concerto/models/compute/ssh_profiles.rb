require 'fog/core/collection'
require 'fog-concerto/models/compute/ssh_profile'

module Fog
	module Concerto
		class Compute
			class SshProfiles < Fog::Collection
				model Fog::Compute::Concerto::SshProfile

				def all
					data = service.list_ssh_profiles.body
					load(data)
				end

				def get(id)
					data = service.get_ssh_profile(id).body
					new(data)
				end
			end
		end
	end
end