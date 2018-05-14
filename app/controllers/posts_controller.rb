class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	layout :resolve_layout

	def index
		@categories = Category.all
		if params[:profile_id]
			@user = User.find(params[:profile_id])
			if params[:tag]
				@post = @user.posts.tagged_with(params[:tag]).order("created_at DESC")
			elsif params[:cate_id]
				@post = []
				@temp_post = @user.posts.order("created_at DESC")
				@temp_post.each do |temp_post|
					if temp_post.categories.include?(params[:cate_id])
						@post << temp_post
					end 
				end
			else
				@post = @user.posts.order("created_at DESC")
			end
		else
			if params[:tag]
				@post = Post.tagged_with(params[:tag]).order("created_at DESC")
			else
				@post = Post.all.order("created_at DESC")
			end
		end


	end

	def new
		@categories = Category.all
		@post = current_user.posts.build
	end

	def create
		@categories = Category.all
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
		
	end

	def show
		@categories = Category.all
		if params[:profile_id]
			@user = User.find(params[:profile_id])
			@post = @user.posts.find(params[:id])
		else
			@post = Post.find(params[:id])
		end

	end

	def edit
		@categories = Category.all
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if current_user.id == @post.user_id
			if @post.update(post_params)
				redirect_to @post
			else
				render 'edit'
			end
		else
			redirect_to root_path
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if current_user.id == @post.user_id
			@post.destroy

			redirect_to root_path
		end
	end

	private

		def post_params
			params.require(:post).permit(:title,:body,:image,:tag_list,categories:[])
		end

		def resolve_layout
			case action_name
			when "index","show"
				if params[:profile_id]
			  		"profile"
			  	else
			  		"application"
			  	end
			else
			  "application"
			end
		end

end
