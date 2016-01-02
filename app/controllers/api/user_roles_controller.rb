module Api
	class UserRolesController < ApiController
		load_and_authorize_resource :user, parent: false

		def update
			@user.update_attributes(update_params)
		end

		private

		def update_params
			params.require(:user).permit(roles: [])
		end
	end
end