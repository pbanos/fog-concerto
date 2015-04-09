module Fog
  module Concerto
    class Compute
      class Mock
        def update_workspace(id, name, domain_id, ssh_profile_id, firewall_profile_id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def update_workspace(id, name, domain_id, ssh_profile_id, firewall_profile_id)
          body = {
            name: name,
            domain_id: domain_id,
            ssh_profile_id: ssh_profile_id,
            firewall_profile_id: firewall_profile_id
          }
          request(
            method: :put,
            path: "cloud/workspaces/#{id}",
            body: body.reject{|key, value| value.nil?},
            expects: [200]
          )
        end
      end
    end
  end
end