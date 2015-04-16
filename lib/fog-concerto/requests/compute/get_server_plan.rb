module Fog
  module Concerto
    class Compute
      class Mock
        def get_server_plan(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_server_plan(id)
          request(path: "cloud/server_plans/#{id}", expects: [200])
        end
      end
    end
  end
end