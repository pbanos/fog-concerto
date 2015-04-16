module Fog
	module Concerto
		class Compute
			class Location < Fog::Model
				identity :id
				attribute :name
			end
		end
	end
end