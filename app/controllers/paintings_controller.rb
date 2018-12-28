class PaintingsController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authorized

    def index
        render json: Painting.all 
    end

    def show
        painting = Painting.find(params[:id])
        if !painting.color1
            painting.addColors
        end
        render json: painting
    end

    def create
        painting = Painting.new(paintings_params)
        if painting.valid? && painting.addColors.kind_of?(Array)
            painting.save
            render json: painting 
        else 
            render json: {message: "Image invalid for color analysis"}, status: :not_acceptable
        end
    end

    # def colors 
    #     painting = Painting.find(params[:id])
    #     render json: painting.colors
    # end

    private 

    def paintings_params
        params.permit(:img_url, :artist, :title, :description)
    end

end
