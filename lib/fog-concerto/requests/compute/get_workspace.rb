module Fog
  module Concerto
    class Compute
      class Mock
        def get_workspace(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_workspace(id)
          request(path: "cloud/workspaces/#{id}", expects: [200])
        end
      end
    end
  end
end