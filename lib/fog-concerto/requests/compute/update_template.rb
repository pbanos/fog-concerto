module Fog
  module Concerto
    class Compute
      class Mock
        def update_template(id, name, generic_image_id, service_list, configuration_attributes)
          Fog::Mock.not_implemented
        end
      end

      class Real
        def update_template(id, name, generic_image_id, service_list, configuration_attributes)
          body = {
            name: name,
            generic_image_id: generic_image_id,
            service_list: service_list,
            configuration_attributes: configuration_attributes
          }
          request(
            method: :put,
            path: "blueprint/templates/#{id}",
            body: body.reject{|key, value| value.nil?},
            expects: [200]
          )
        end
      end
    end
  end
end