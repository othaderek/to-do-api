class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
      User.find(params[:id])
    end

    def create
        @user = User.create(user_params)

        if @user.valid?
          render json: @user
        else
          render json: {errors: user.errors.full_messages}, status: unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
