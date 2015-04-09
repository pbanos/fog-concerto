module Fog
  module Concerto
    class Compute
      class Mock
        def create_domain(name, ttl, contact, minimum)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def create_domain(name, ttl, contact, minimum)
          body = {
            name: name,
            ttl: ttl,
            contact: contact,
            minimum: minimum
          }
          request(
            method: :post,
            path: "dns/domains",
            body: body.reject{|key, value| value.nil?},
            expects: [201]
          )
        end
      end
    end
  end
end