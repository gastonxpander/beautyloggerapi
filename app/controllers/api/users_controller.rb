module Api
	class UsersController < Api::BaseController
		def show
		  user = @current_user.email
		  render json: user, root: false
		end
	end
end
