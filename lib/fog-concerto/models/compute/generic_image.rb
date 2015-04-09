module Fog
	module Concerto
		class Compute
			class GenericImage < Fog::Model
				identity :id
				attribute :name
			end
		end
	end
end