module Fog
  module Concerto
    class Compute
      class Mock
        def list_cloud_providers
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_cloud_providers
          request(path: 'cloud/cloud_providers', expects: [200])
        end
      end
    end
  end
end
