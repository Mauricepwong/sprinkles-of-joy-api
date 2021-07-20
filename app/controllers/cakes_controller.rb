class CakesController < ApplicationController
    before_action :set_enquiry, only: [:show]

    def index
        @cakes = Cake.all
        render json: @cakes
    end

    def create
        @cake = Cake.create(cake_params)
        if @cake.errors.any?
            render json: @cake.errors, status: :unprocessable_entity
        else
            render json: @cake, status: 201 
        end
    end
    
    def show
        render json: @cake
    end

    private 

    def set_enquiry
        begin
            @enquiry = Enquiry.find(params[:id])
        rescue 
            render json: {error: "Not found"} status: 404 
        end
    end

    def cake_params
        params.require(:cake).permit(:name, :description, :ingredients, :picture)
    end    

end