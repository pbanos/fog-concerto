module Fog
  module Concerto
    class Compute
      class Mock
        def list_domains
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_domains
          request(path: 'dns/domains', expects: [200])
        end
      end
    end
  end
end
