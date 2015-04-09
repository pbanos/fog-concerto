module Fog
  module Concerto
    class Compute
      class Mock
        def list_ssh_profiles
          Fog::Mock.not_implemented
        end
      end

      class Real
        def list_ssh_profiles
          request(path: 'cloud/ssh_profiles', expects: [200])
        end
      end
    end
  end
end
