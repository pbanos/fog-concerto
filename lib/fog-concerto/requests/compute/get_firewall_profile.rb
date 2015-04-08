module Fog
  module Concerto
    class Compute
      class Mock
        def get_firewall_profile(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_firewall_profile(id)
          request(path: "network/firewall_profiles/#{id}", expects: [200])
        end
      end
    end
  end
end