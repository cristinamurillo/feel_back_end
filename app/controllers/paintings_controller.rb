class PaintingsController < ApplicationController

    def index
        
    end

    def show
    end

    def create
        Painting.create(paintings_params)
    end

    def colors
        byebug
        painting = Painting.find(params[:id])

    end

    private 

    def paintings_params
        params.permit(:img_url, :artist, :title, :description)
    end
end
