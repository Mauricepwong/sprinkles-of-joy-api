class UsersController < ApplicationController
    before_action :authenticate_user, only: [:index, :update, :destroy]
        

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

    # def update 
    # end

    # def delete
    # end 

    def index
        @user = user.all
        render json: @enquiries
    end

    private 
    def user_params
        params.permit(:username, :email, :first_name, :last_name, :middle_name, :password, :password_confirmation )
    end
end
