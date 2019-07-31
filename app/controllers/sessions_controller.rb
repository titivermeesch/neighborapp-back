class SessionsController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:update, :destroy]

    def create
        user = User.where(email: params[:email]).first

        if(!user.nil?)
            if user.valid_password?(params[:password])
                render json: {
                    status: 'SUCCESS',
                    message: 'Session created',
                    data: user
                    }, status: :created
                else 
                    render json: {
                    status: 'ERROR',
                    message: 'Incorrect password'
                }, status: :unprocessable_entity
            end
        else 
            render json: {
                status: 'ERROR',
                message: 'Account not found'
            }, status: :unprocessable_entity
        end
    end

    def destroy
        current_user&.authentication_token = nil
        if current_user&.save
            head(:ok)
        else
            head(:unauthorized)
        end
    end

    def show
        user = User.where(authentication_token: params[:id]).first

        if(user.present?)
            render json: {
                    status: 'SUCCESS',
                    message: 'Token valid',
                    }, status: :ok
                else 
                    render json: {
                    status: 'ERROR',
                    message: 'Token is invalid'
                }, status: :unprocessable_enti
        end
    end
end