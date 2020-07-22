class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all 
        render json: users, only: [:id, :username, :password]
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user.slice(:id, :username, :password)
        else 
            render json: {message: "User Not Found!"}
        end
    end

    def new 
        user = User.new
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def edit 
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(current_user.id)
      @user = User.update(user_params)
      render json: @user.to_json
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :bio, :avatar)
    end
end
