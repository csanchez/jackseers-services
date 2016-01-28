class Api::V1::UsersController < ApplicationController
	def create
		user=User.new(user_params)
		respond_to do |format|
			format.json {
				if user.save
					render json: {
						auth_token: user.encode,
						message: 'Tu cuenta ha sido creada. Bienvenido Pirata!',
						status: :created
					}
				else
					render json: {
						errors: user.errors,
						message: 'Ocurrio un error al crear usuario',
						status: :not_acceptable
					}
				end
			}
		end	
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
	end
end

		