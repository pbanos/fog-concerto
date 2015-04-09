module Fog
  module Concerto
    class Compute
      class Mock
        def list_template_servers(template_id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_template_servers(template_id)
          request(path: "blueprint/templates/#{template_id}/servers", expects: [200])
        end
      end
    end
  end
end