module Fog
  module Concerto
    class Compute
      class Mock
        def list_locations
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_locations
          request(path: 'wizard/locations', expects: [200])
        end
      end
    end
  end
end
