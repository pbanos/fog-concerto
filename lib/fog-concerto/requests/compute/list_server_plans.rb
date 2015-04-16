module Fog
  module Concerto
    class Compute
      class Mock
        def list_server_plans(cloud_provider_id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_server_plans(cloud_provider_id)
          request(path: "cloud/cloud_providers/#{cloud_provider_id}/server_plans", expects: [200])
        end
      end
    end
  end
end
