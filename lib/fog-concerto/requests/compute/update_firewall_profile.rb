module Fog
  module Concerto
    class Compute
      class Mock
        def update_firewall_profile(id, name, description, rules)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def update_firewall_profile(id, name, description, rules)
          body = {
            name: name,
            description: description,
            rules: rules
          }
          request(
            method: :put,
            path: "network/firewall_profiles/#{id}",
            body: body.reject{|key, value| value.nil?},
            expects: [200]
          )
        end
      end
    end
  end
end