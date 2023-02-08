class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        render json: User.all()
    end

    def create
        render json: User.create(email: params[:email], password: params[:password], name: params[:name], phone: params[:phone])
    end

    def check_password
        user = User.find_by(email: params[:email])
        if !user
            render json: "User not found"
        elsif user.authenticate(params[:password])
            render json: "Password Matched!"
        else
            render json: "Wrong Password"
        end
    end

    def update_password
        user = User.find_by(email: params[:email])
        if !user
            render json: "User not found"
        elsif user.authenticate(params[:old_password])
            user.update(password: params[:new_password])
            render json: user
        else
            render json: "Incorrect Password"
        end
    end

    def users_pagination
        render json: User.limit(params[:size]).offset((params[:index].to_i - 1) * params[:size].to_i)
    end
end
