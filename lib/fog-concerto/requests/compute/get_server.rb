module Fog
  module Concerto
    class Compute
      class Mock
        def get_server(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_server(id)
          request(path: "cloud/servers/#{id}", expects: [200])
        end
      end
    end
  end
end