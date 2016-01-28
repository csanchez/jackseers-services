class Api::V1::AuthController < ApplicationController
	def authenticate
		user = login(params[:email], [:password])
		respond_to do |format|
			format.json {

				if user
					render json: authentication_payload(user)
				else
					render json: { errors: ['Invalid username or password'] }, status: :unauthorized
				end
			}
		end	
	end


	private

	def authentication_payload(user)
		return nil unless user && user.id
		{
			auth_token: user.encode
      user: { id: user.id, nickname: user.nickname } # return whatever user info you need
 		 }
	end
end
