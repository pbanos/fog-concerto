module Fog
  module Concerto
    class Compute
      class Mock
        def list_workspaces
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_workspaces
          request(path: 'cloud/workspaces', expects: [200])
        end
      end
    end
  end
end
