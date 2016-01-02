class UserRolesController < ApplicationController
	load_and_authorize_resource :user, parent: false

	def index
	end
end