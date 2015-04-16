module Fog
  module Concerto
    class Compute
      class Mock
        def shutdown_server(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def shutdown_server(id)
          request(method: :put, path: "cloud/servers/#{id}/shutdown", expects: [200])
        end
      end
    end
  end
end