module Fog
  module Concerto
    class Compute
      class Mock
        def list_generic_images
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_generic_images
          request(path: 'cloud/generic_images', expects: [200])
        end
      end
    end
  end
end
