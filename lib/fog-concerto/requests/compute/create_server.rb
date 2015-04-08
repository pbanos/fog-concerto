module Fog
	module Concerto
		class Compute
			class Mock
				def create_server(name, fqdn, workspace_id, template_id, server_plan_id)
					Fog::Mock.not_implemented
				end
			end

			class Real
				def create_server(name, fqdn, workspace_id, template_id, server_plan_id)
					request(
						method: :post,
						path: "cloud/servers",
						body: {
							name: name,
							fqdn: fqdn,
							workspace_id: workspace_id,
							template_id: template_id,
							server_plan_id: server_plan_id
						},
						expects: [201]
					)
				end
			end
		end
	end
end