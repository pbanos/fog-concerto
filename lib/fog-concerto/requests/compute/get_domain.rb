module Fog
  module Concerto
    class Compute
      class Mock
        def get_domain(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_domain(id)
          request(path: "dns/domains/#{id}", expects: [200])
        end
      end
    end
  end
end