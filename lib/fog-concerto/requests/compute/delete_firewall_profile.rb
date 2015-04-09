module Fog
  module Concerto
    class Compute
      class Mock
        def delete_firewall_profile(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_firewall_profile(id)
          request(method: :delete, path: "network/firewall_profiles/#{id}", expects: [204])
        end
      end
    end
  end
end