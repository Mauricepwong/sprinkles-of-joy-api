class EnquiriesController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

    def index
        @enquires = Enquiry.all
        render json: @enquiries
    end
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

## Test this
def destroy 
    @enquiry.delete
    render json: 204
end

private
def set_enquiry
    begin
        @enquiry = Enquiry.find(params[:id])
    rescue 
        render json: {error: "Not found"} status: 404 
    end
end

def enquiry_params
    params.require(:enquiry).permit(:name, :topic_id, :contact, :message)
end    