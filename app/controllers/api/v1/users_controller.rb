class Api::v1::UsersController < ApplicationController
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
        private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end
end