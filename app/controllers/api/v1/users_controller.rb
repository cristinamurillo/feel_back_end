class Api::V1::UsersController < ApplicationController
    protect_from_forgery prepend: true
    skip_before_action :authorized, only: [:index, :create]

    def index
        render json: User.all 
    end

    def profile 
        user = current_user
        render json: {user: UserSerializer.new(current_user)}, status: :accepted 
   
    end

    def timeline 
        user = current_user
        render json: user.user_paintings, :include => :painting
    end
    
    def create 
        @user = User.create(user_params)
     
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
        else  
            render json: {errors: @user.errors}, status: :not_acceptable
        end 
    end
    

    private

    def user_params 
        params.permit(:email, :password, :first_name, :last_name)
    end
end
