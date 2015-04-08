module Fog
	module Concerto
		MAJOR = '0'.freeze
		MINOR = '0'.freeze
		PATCH = '0'.freeze
	  	PRERELEASE = nil #'rc.2'.freeze # Set to nil for stable version
	  	VERSION = [MAJOR, MINOR, PATCH, PRERELEASE].compact.join('.').freeze
	end
end