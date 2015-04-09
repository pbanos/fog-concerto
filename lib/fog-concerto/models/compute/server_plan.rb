module Fog
	module Concerto
		class Compute
			class ServerPlan < Fog::Model
				identity :id
				attribute :name
				attribute :memory
				attribute :cpus
				attribute :storage
				attribute :location_id
				attribute :cloud_provider_id
			end
		end
	end
end