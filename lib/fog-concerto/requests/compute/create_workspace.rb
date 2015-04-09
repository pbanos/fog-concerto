module Fog
  module Concerto
    class Compute
      class Mock
        def create_workspace(name, domain_id, ssh_profile_id, firewall_profile_id)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def create_workspace(name, domain_id, ssh_profile_id, firewall_profile_id)
          request(
          	method: :post,
          	path: "cloud/workspaces",
          	body: {
          		name: name,
          		domain_id: domain_id,
          		ssh_profile_id: ssh_profile_id,
          		firewall_profile_id: firewall_profile_id
          	},
          	expects: [201]
          )
        end
      end
    end
  end
end