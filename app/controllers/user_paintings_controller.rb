class UserPaintingsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]
    skip_before_action :verify_authenticity_token

    def index
        render json: UserPainting.all, :include => :painting
    end

    def create
        join = UserPainting.create(user_paintings_params)
        
        if join.valid?
            render json: {message: "Artwork added to collection"}
        else 
            render json: {message: "You must log in or create an account to save an artwork"}, status: :not_acceptable
        end
    end

    private 
    
    def user_paintings_params
        params.permit(:user_id, :painting_id)
    end
end
