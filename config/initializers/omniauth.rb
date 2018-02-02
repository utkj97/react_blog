Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['147070659342782'], ENV['42b8200bb2da1d309af7653fa01bf338'],
	scope: 'public_profile', info_fields: 'id,name,link'

	OmniAuth.config.on_failure = Proc.new do |env|
    	SessionsController.action(:auth_failure).call(env)
    	# error_type = env['omniauth.error.type']
	    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
	    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
    end
end