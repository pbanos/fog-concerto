require 'fog/core'
require 'fog-concerto/version'

module Fog
	module Concerto
		extend Fog::Provider
		service(:compute, 'Compute')
	end
end

require 'fog-concerto/compute'