module Api
	class BaseController < ApplicationController
		require 'auth_token'

		before_action :validate_token

		private

			def validate_token
			  begin
			    token = request.headers['Authorization'].split(' ').last
			    payload, header = AuthToken.valid?(token)
			    @current_user = User.find_by(id: payload['user_id'])
			  rescue
			    render json: { error: 'Authorization header not valid'}, status: :unauthorized
			  end
			end

	end
end