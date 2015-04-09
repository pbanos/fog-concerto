module Fog
  module Concerto
    class Compute
      class Mock
        def get_ssh_profile(id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def get_ssh_profile(id)
          request(path: "cloud/ssh_profiles/#{id}", expects: [200])
        end
      end
    end
  end
end