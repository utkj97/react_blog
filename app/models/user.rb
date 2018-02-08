class User < ApplicationRecord
	has_many :posts
	
	class << self
		def from_omniauth(auth_hash)
			user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
			user.name = auth_hash['info']['name']
			user.email = auth_hash['info']['email']
			user.url = auth_hash['info']['urls'][user.provider.capitalize]
			user.save!
			user
		end
	end
end
