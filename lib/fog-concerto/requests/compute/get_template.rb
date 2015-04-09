module Fog
  module Concerto
    class Compute
      class Mock
        def get_template(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_template(id)
          request(path: "blueprint/templates/#{id}", expects: [200])
        end
      end
    end
  end
end