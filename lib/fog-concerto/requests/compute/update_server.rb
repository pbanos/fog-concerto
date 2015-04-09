module Fog
  module Concerto
    class Compute
      class Mock
        def update_server(id, name, fqdn)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def update_server(id, name, fqdn)
          body = {
            name: name,
            fqdn: fqdn
          }
          request(
            method: :put,
            path: "cloud/servers/#{id}",
            body: body.reject{|key, value| value.nil?},
            expects: [200]
          )
        end
      end
    end
  end
end