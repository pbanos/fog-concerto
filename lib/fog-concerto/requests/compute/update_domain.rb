module Fog
  module Concerto
    class Compute
      class Mock
        def update_domain(id, ttl, contact, minimum)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def update_domain(id, ttl, contact, minimum)
          body = {
            ttl: ttl,
            contact: contact,
            minimum: minimum
          }
          request(
            method: :put,
            path: "dns/domains/#{id}",
            body: body.reject{|key, value| value.nil?},
            expects: [200]
          )
        end
      end
    end
  end
end