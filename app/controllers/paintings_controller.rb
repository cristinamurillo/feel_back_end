class PaintingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: Painting.all 
    end

    def show
        render json: Painting.find(params[:id])
    end

    def create
        painting = Painting.create(paintings_params)
        if painting.valid? 
            render json: painting 
        end
    end

    def colors 
        painting = Painting.find(params[:id])
        render json: painting.colors
    end

    private 

    def paintings_params
        params.permit(:img_url, :artist, :title, :description)
    end

end
