class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	layout :resolve_layout

	def show
		@user = User.find(params[:id])
		@post = @user.posts.order("created_at DESC")
	end

	def index
		@profile = User.search(params[:search]).order('firstname DESC').paginate(:per_page => 5, :page => params[:page])
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
