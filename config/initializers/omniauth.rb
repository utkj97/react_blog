Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '147070659342782', '42b8200bb2da1d309af7653fa01bf338',
	scope: 'public_profile', info_fields: 'id,name,link'
	provider :google_oauth2, '566981368486-ha7a005l03ibsdmsvtma43l9jt8l98ut.apps.googleusercontent.com', 'Z0mWuMF4jacEo5zWYuXVXnbt',
	access_type: 'online'
	provider :github, 'e66229b3e340a404eb2d', '05a9047245a40a09fc9852837d57059048712980'

	OmniAuth.config.on_failure = Proc.new do |env|
    	SessionsController.action(:auth_failure).call(env)
    	# error_type = env['omniauth.error.type']
	    # new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{error_type}"
	    # [301, {'Location' => new_path, 'Content-Type' => 'text/html'}, []]
    end
end