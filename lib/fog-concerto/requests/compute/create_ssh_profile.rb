module Fog
  module Concerto
    class Compute
      class Mock
        def create_ssh_profile(name, public_key, private_key)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def create_ssh_profile(name, public_key, private_key)
          body = {
            name: name,
            public_key: public_key,
            private_key: private_key
          }
          request(
            method: :post,
            path: "cloud/ssh_profiles",
            body: body.reject{|key, value| value.nil?},
            expects: [201]
          )
        end
      end
    end
  end
end