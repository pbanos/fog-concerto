module Fog
	module Concerto
		class Compute
			class SshProfile < Fog::Model
				identity :id
				attribute :name
				attribute :public_key
				attribute :private_key

				def destroy
					requires :id
					service.delete_ssh_profile(id).body
				end

				def save
					requires :name, :public_key
					if id
						data = service.update_ssh_profile(id, name, public_key, private_key).body
						merge_attributes(data)
					else
						data = service.create_ssh_profile(name, public_key, private_key).body
						merge_attributes(data)
					end
				end
			end
		end
	end
end