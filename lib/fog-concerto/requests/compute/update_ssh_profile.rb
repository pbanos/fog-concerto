module Fog
  module Concerto
    class Compute
      class Mock
        def update_ssh_profile(id, name, public_key, private_key)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def update_ssh_profile(id, name, public_key, private_key)
          body = {
            name: name,
            public_key: public_key,
            private_key: private_key
          }
          request(
            method: :put,
            path: "cloud/ssh_profiles/#{id}",
            body: body.reject{|key, value| value.nil?},
            expects: [200]
          )
        end
      end
    end
  end
end