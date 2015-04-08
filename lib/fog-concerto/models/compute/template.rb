module Fog
	module Concerto
		class Compute
			class Template < Fog::Model
				identity :id
				attribute :name
				attribute :generic_image_id
				attribute :service_list
				attribute :configuration_attributes

				def initialize(attributes= {})
					self.generic_image = attributes.delete(:generic_image)
					super
				end

				def generic_image=(generic_image)
					@generic_image = generic_image
					if generic_image
						self.generic_image_id = generic_image.id
					else
						self.generic_image_id = nil
					end
				end

				def generic_image
					@generic_image ||= service.generic_images.get(generic_image_id) if generic_image_id
				end

				def destroy
					requires :id
					service.delete_template(id).body
				end

				def save
					requires :name, :generic_image_id, :service_list, :configuration_attributes
					if id
						data = service.update_template(id, name, generic_image_id, service_list, configuration_attributes).body
						merge_attributes(data)
					else
						data = service.create_template(name, generic_image_id, service_list, configuration_attributes).body
						merge_attributes(data)
					end
				end
			end
		end
	end
end