require 'fog/json'

module Fog
	module Concerto
		class Compute < Fog::Service
			requires :concerto_public_cert, :concerto_private_key
			recognizes :host, :path, :persistent, :port, :concerto_ca_file, :concerto_api_version

			secrets :concerto_private_key

			model_path 'fog-concerto/models/compute'
			model :server
			collection :servers
			model :workspace
			collection :workspaces
			model :firewall_profile
			collection :firewall_profiles
			model :ssh_profile
			collection :ssh_profiles
			model :domain
			collection :domains
			model :template
			collection :templates
			model :generic_image
			collection :generic_images
			model :server_plan
			collection :server_plans
			model :cloud_provider
			collection :cloud_providers
			model :location
			collection :locations

			request_path 'fog-concerto/requests/compute'
			request :list_workspaces
			request :get_workspace
			request :create_workspace
			request :update_workspace
			request :delete_workspace
			request :list_workspace_servers

			request :get_server
			request :create_server
			request :update_server
			request :boot_server
			request :shutdown_server
			request :reboot_server
			request :override_server
			request :delete_server

			request :list_firewall_profiles
			request :get_firewall_profile
			request :create_firewall_profile
			request :update_firewall_profile
			request :delete_firewall_profile

			request :list_ssh_profiles
			request :get_ssh_profile
			request :create_ssh_profile
			request :update_ssh_profile
			request :delete_ssh_profile
			
			request :list_domains
			request :get_domain
			request :create_domain
			request :update_domain
			request :delete_domain

			request :list_templates
			request :get_template
			request :create_template
			request :update_template
			request :delete_template
			request :list_template_servers
			
			request :list_generic_images
			request :list_cloud_providers
			request :list_server_plans
			request :get_server_plan
			request :list_locations
			

			class Real

				def initialize(options)
					@concerto_api_version = options[:concerto_api_version] || :v1
					@host       = options[:host]        || "clients.concerto.io"
					@path       = if options[:path] 
						separator = options[:path] =~ /\/\Z/ ? '' : '/'
						"#{options[:path]}#{separator}#{@concerto_api_version}"
					else
						"/#{@concerto_api_version}"
					end
					@persistent = options[:persistent]  || false
					@port       = options[:port]        || 886
					@concerto_public_cert = options[:concerto_public_cert]
					@concerto_private_key = options[:concerto_private_key]
					@concerto_ca_file = options[:concerto_ca_file]
					connection_options = {
						headers: {'Accept' => 'application/json'},
						client_cert: @concerto_public_cert,
						client_key: @concerto_private_key,
					}
					connection_options[:ssl_ca_file] = @concerto_ca_file  if @concerto_ca_file
					@connection = Fog::Core::Connection.new("https://#{@host}:#{@port}", @persistent, connection_options)
				end

				def request(parameters)
					method = parameters[:method] || :get
					request_path = File.join(@path, parameters[:path])
					body = parameters[:body]
					query = parameters[:query]
					expects = parameters[:expects]
					headers =  {}
					headers['Content-Type'] = 'application/json' if method != :get and body
					request = {method: method, headers: headers, path: request_path, expects: expects}
					if method != :get
						request[:body] = body.to_json if body
					else
						request[:query] = query if query
					end
					request[:expects] = expects if expects
					request[:persistent] = parameters[:persistent] if parameters.has_key?(:persistent)
					response = @connection.request(request)
					parse(response)
				end

				private
				def parse(response)
					return response if response.body.empty?
					response.body = Fog::JSON.decode(response.body)
					response
				end
			end

			class Mock
			end
		end
	end
end