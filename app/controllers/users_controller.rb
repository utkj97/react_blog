class UsersController < ApplicationController
	def update_profile
		if current_user
			if current_user.username.blank? || current_user.name.blank? || current_user.college.blank?
				@user_page = true
				@user = []
				@user << { username: current_user.username, name: current_user.name, college: current_user.college}
			else
				redirect_to request.env['omniauth-origin'] || root_url
			end
		else
			redirect_to request.env['omniauth-origin'] || root_url
		end
	end

	def save_update
		username = params[:username]
		user = User.where(username: username).first
		if user.nil? && !(username =~ /^[a-zA-Z0-9_]*$/).nil? && username.length > 1
			current_user.username = username
		end
		current_user.college = params[:college]
		current_user.name = params[:name]
		current_user.save!
		flash[:notice] = "Welcome to react blog"
		redirect_to root_url
	end

	def checkusername
		username = params[:username]
		user = User.where(username: username).first
		data = {}
	    data[:status] = if user.nil? && !(username =~ /^[a-zA-Z0-9_]*$/).nil?
	                      'GoodToGo'
	                    else
	                      'Nope'
	                    end
	    respond_to do |format|
	      format.json { render json: data }
	    end	
	end

	def profile
		@profile_page = true
		@user = User.where(username: params[:username]).first
	end
end
