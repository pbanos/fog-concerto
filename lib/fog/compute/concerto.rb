require 'fog-concerto/compute'

# The reason for this file is that Fog::Compute looks here for a Concerto module. 
# It is expected to look for a Compute module in Fog::Concerto in the future,
# according to https://github.com/fog/fog/wiki/fog-design-document

Fog::Compute::Concerto = Fog::Concerto::Compute