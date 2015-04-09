module Fog
  module Concerto
    class Compute
      class Mock
        def create_firewall_profile(name, description, rules)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def create_firewall_profile(name, description, rules)
          body = {
            name: name,
            description: description,
            rules: rules
          }
          request(
            method: :post,
            path: "network/firewall_profiles",
            body: body.reject{|key, value| value.nil?},
            expects: [201]
          )
        end
      end
    end
  end
end