class CakesController < ApplicationController
    before_action :authenticate_user, only: [:create, :update, :destroy]
    before_action :set_cake, only: [:show, :update, :destroy]
    before_action :check_admin, only: [:create, :update, :destroy]


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

    def update 
        @cake.update(cake_params)
        if @cake.errors.any?
            render json: @enquiry.errors, status: :unprocessable_entity
        else
            render json: @enquiry, status: 201 
        end
    end

    def destroy 
        @cake.delete
        render json: {message: "Cake deleted"}
    end

    private 

    def set_cake
        begin
            @cake = Cake.find(params[:id])
        rescue 
            render json: {error: "Cake not found"}, status: 404 
        end
    end
    
    def check_admin
        if (current_user.admin == false)  
            render json: {error: "You dont have permission to perform this action"}, status:401 
        end
    end

    def cake_params
        params.require(:cake).permit(:name, :description, :ingredients, :image, :price)
    end
end
