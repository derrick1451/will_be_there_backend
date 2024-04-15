class Api::V1::UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @users = User.all
        render json: @users
    end
    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token},status: :created
        else
            render json: {errors: 'invalid user name or password'}, status: :not_acceptable
        end
    end
    def login
        @user = User.find_by(email: user_params[:email])
        if @user && @user.authenticate(user_params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}, status: :ok
        else
            render json: {errors: 'invalid user name or password'}, status: :not_acceptable
        end
    
    end


        private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end
end