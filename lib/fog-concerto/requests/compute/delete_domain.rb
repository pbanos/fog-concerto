module Fog
  module Concerto
    class Compute
      class Mock
        def delete_domain(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_domain(id)
          request(method: :delete, path: "dns/domains/#{id}", expects: [204])
        end
      end
    end
  end
end