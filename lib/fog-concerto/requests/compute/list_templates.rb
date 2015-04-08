module Fog
  module Concerto
    class Compute
      class Mock
        def list_templates
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_templates
          request(path: 'blueprint/templates', expects: [200])
        end
      end
    end
  end
end
