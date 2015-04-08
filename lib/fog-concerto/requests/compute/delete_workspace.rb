module Fog
  module Concerto
    class Compute
      class Mock
        def delete_workspace(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_workspace(id)
          request(method: :delete, path: "cloud/workspaces/#{id}", expects: [204])
        end
      end
    end
  end
end