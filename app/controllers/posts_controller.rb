class PostsController < ApplicationController
	before_action :require_login, except: [:index, :show]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def index
		@posts = Post.all.order('created_at DESC')
	end

	def show
		@post = Post.friendly.find(params[:id])
	end

	def edit
		@post = Post.friendly.find(params[:id])
	end

	def update
		@post = Post.frindly.find(params[:id])
		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :slug)
	end

	def require_login
		if !current_user
			flash[:error] = "Please login to add posts"
			redirect_to root_path
		end
	end
end
