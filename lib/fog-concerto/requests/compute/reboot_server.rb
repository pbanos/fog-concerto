module Fog
  module Concerto
    class Compute
      class Mock
        def reboot_server(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def reboot_server(id)
          request(method: :put, path: "cloud/servers/#{id}/reboot", expects: [200])
        end
      end
    end
  end
end