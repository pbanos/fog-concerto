module Fog
  module Concerto
    class Compute
      class Mock
        def boot_server(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def boot_server(id)
          request(method: :put, path: "cloud/servers/#{id}/boot", expects: [200])
        end
      end
    end
  end
end