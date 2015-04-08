module Fog
	module Concerto
		class Compute
			class Domain < Fog::Model
				identity :id
				attribute :name
				attribute :ttl
				attribute :contact
				attribute :minimum
				attribute :enabled

				def destroy
					requires :id
					service.delete_domain(id).body
				end

				def save
					requires :name, :ttl, :contact, :minimum
					if id
						data = service.update_domain(id, ttl, contact, minimum).body
						merge_attributes(data)
					else
						data = service.create_domain(name, ttl, contact, minimum).body
						merge_attributes(data)
					end
				end
			end
		end
	end
end