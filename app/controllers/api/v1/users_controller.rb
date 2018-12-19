class Api::V1::UsersController < ApplicationController
    protect_from_forgery prepend: true
    
    def index
    
        render json: User.all 
    end
    def create 
        byebug
        @user = User.create(user_params)
     
        if @user.valid?
            render json: {user: UserSerializer.new(@user)}, status: :created
        else  
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end 
    end

    private

    def user_params 
        params.permit(:email, :password, :first_name, :last_name)
    end
end
