module Fog
  module Concerto
    class Compute
      class Mock
        def list_workspace_servers(workspace_id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_workspace_servers(workspace_id)
          request(path: "cloud/workspaces/#{workspace_id}/servers", expects: [200])
        end
      end
    end
  end
end
