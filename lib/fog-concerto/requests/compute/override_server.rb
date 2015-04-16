module Fog
  module Concerto
    class Compute
      class Mock
        def override_server(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def override_server(id)
          request(method: :put, path: "cloud/servers/#{id}/override", expects: [200])
        end
      end
    end
  end
end