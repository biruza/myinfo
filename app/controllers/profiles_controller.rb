class ProfilesController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
	layout :resolve_layout

	def show
		@user = User.find(params[:id])
		@post = @user.posts.order("created_at DESC")
	end

	def index
		@profile = User.all.order("created_at DESC")
	end

	private

	def resolve_layout
		case action_name
		when "show"
		  "profile"
		else
		  "application"
		end
	end
end
