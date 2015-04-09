module Fog
  module Concerto
    class Compute
      class Mock
        def delete_template(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_template(id)
          request(method: :delete, path: "blueprint/templates/#{id}", expects: [204])
        end
      end
    end
  end
end