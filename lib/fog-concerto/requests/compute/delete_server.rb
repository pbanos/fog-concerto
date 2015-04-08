module Fog
  module Concerto
    class Compute
      class Mock
        def delete_server(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_server(id)
          request(method: :delete, path: "cloud/servers/#{id}", expects: [204])
        end
      end
    end
  end
end