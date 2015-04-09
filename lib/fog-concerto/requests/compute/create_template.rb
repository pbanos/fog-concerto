module Fog
  module Concerto
    class Compute
      class Mock
        def create_template(name, generic_image_id, service_list, configuration_attributes)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def create_template(name, generic_image_id, service_list, configuration_attributes)
          body = {
            name: name,
            generic_image_id: generic_image_id,
            service_list: service_list,
            configuration_attributes: configuration_attributes
          }
          request(
          	method: :post,
          	path: "blueprint/templates",
          	body: body.reject{|key, value| value.nil?},
          	expects: [201]
          )
        end
      end
    end
  end
end