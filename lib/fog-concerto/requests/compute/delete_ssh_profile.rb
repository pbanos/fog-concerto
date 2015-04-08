module Fog
  module Concerto
    class Compute
      class Mock
        def delete_ssh_profile(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def delete_ssh_profile(id)
          request(method: :delete, path: "cloud/ssh_profiles/#{id}", expects: [204])
        end
      end
    end
  end
end