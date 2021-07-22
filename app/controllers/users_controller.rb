class UsersController < ApplicationController 
    before_action :authenticate_user, only: [:show, :update, :destroy]
    before_action :set_user, only: [:show, :update, :destroy] 
    before_action :check_ownership, only: [:update, :destroy]

    def create
        @user = User.create(user_params)
        
        if @user.save
            auth_token = Knock::AuthToken.new payload: {sub:@user.id}
            render json: { username: @user.username, jwt: auth_token.token }, status: 201
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def sign_in
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub:@user.id}
            render json: {username: @user.username, jwt: auth_token.token}, status: 200 
        else
            render json: {error: "Incorrect Email or Password"}, status: 404
        end
    end

    def show
        if current_user.admin?
            @users = User.all
            render json: @users
        else
            render json: @user
        end
    end

    def update 
        @user.update(user_params)
        if @user.errors.any?
            render json: @user.errors, status: :unprocessable_entity
        else
            render json: @enquiry, status: 201 
        end
    end

    def destroy 
        @user.delete
        render json: 204
    end

    private 
    def user_params
        params.permit(:username, :email, :first_name, :last_name, :middle_name, :password, :password_confirmation )
    end

    def set_user
        begin
            @user = User.find(params[:id])
        rescue 
            render json: {error: "user not found"}, status: 404 
        end
    end

    def check_ownership
        if (current_user.id != @user.id) || (current_user.admin == false) 
            render json: {error: "you dont have permission to perform this action"}, status:401 
        end
    end
end
