class PaintingsController < ApplicationController

    def index
        render json: Painting.all 
    end

    def show
        render json: Painting.find(params[:id])
    end

    def create
        Painting.create(paintings_params)
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
