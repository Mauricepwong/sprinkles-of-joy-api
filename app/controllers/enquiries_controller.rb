class EnquiriesController < ApplicationController
    before_action :authenticate_user, except: [:test]
    before_action :set_enquiry, only: [:show, :update, :destroy]
    before_action :check_ownership, only: [:update, :destroy]

    def index
        @enquiries = current_user.enquiries
        render json: @enquiries
    end

    def create
        @enquiry = current_user.enquiries.create(enquiry_params)
        if @enquiry.errors.any?
            render json: @enquiry.errors, status: :unprocessable_entity
        else
            render json: @enquiry, status: 201 
        end
    end

    def show
        render json: @enquiry.convert_enquiry
    end

    def update 
        @enquiry.update(enquiry_params)
        if @enquiry.errors.any?
            render json: @enquiry.errors, status: :unprocessable_entity
        else
            render json: @enquiry, status: 201 
        end
    end

    def destroy 
        @enquiry.delete
        render json: 204
    end

    def admin
        @enquiries = Enquiry.all
        render json: @enquiries
    end

    def test
        @enquiries = Enquiry.all
        render json: @enquiries
    end

    private
    def set_enquiry
        begin
            @enquiry = Enquiry.find(params[:id])
        rescue 
            render json: {error: "Enquiry not found"}, status: 404 
        end
    end

    def check_ownership
        if current_user.id != @enquiry.user.id
            render json: {error: "you dont have permission to perform this action"}, status:401 
        end
    end

    def enquiry_params
        params.require(:enquiry).permit(:name, :topic_id, :contact, :message)
    end    

    # need to admin method 
end