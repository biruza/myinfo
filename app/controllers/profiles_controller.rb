class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	layout :resolve_layout

	def show
		@user = User.find(params[:id])
		@post = @user.posts.order("created_at DESC")
	end

	def index

		@search = if params[:formsearch][:search_keyword]
			@profile = User.where('firstname LIKE ?',"%#{params[:formsearch][:search_keyword]}").order("created_at DESC")
		else
			@profile = User.all.order("created_at DESC")
		end
	end

	private

	def profile_params
		params.require(:formsearch).permit(:search_keyword)
	end

	def resolve_layout
		case action_name
		when "show"
		  "profile"
		else
		  "application"
		end
	end
end
