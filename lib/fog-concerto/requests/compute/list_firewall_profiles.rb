module Fog
  module Concerto
    class Compute
      class Mock
        def list_firewall_profiles
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_firewall_profiles
          request(path: 'network/firewall_profiles', expects: [200])
        end
      end
    end
  end
end
