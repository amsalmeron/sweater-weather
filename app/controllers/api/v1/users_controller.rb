class Api::V1::UsersController < ApplicationController 
    def create
        if params[:password] == params[:password_confirmation]
            user = User.create(user_params)
            return invalid_credentials if user.auth_token.nil?
            render json: UserSerializer.user_data(user), status: 201
        else
            render status: 400
        end
    end

    private 

    def user_params
        params.permit(:email, :password, :password_confirmation)
    end

    def invalid_credentials
        render json: { data: { message: 'Invalid Email or Password' }}
    end
end