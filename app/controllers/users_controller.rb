class UsersController < ApplicationController
    acts_as_token_authentication_handler_for User, except: [:create]
    def create
        user = User.create(sign_up_params)
        if(user.save)
            render json: {
                    status: 'SUCCESS',
                    message: 'User saved',
                    data: user
                }, status: :created
            else 
                render json: {
                    status: 'ERROR',
                    message: 'User not saved',
                    data: user.errors
                }, status: :unprocessable_entity
        end
    end

    def update
        user = User.where(email: params[:user_email]).first
        user.firstname = params[:firstname]
        user.lastname = params[:lastname]
        user.username = params[:username]
        user.email = params[:email]
        user.address = params[:address]

        if(user.save)
            render json: {
                status: 'SUCCESS',
                message: 'User saved',
                data: user
            }, status: :ok
        else
            render json: {
                status: 'ERROR',
                message: 'User not saved',
                data: user.errors
            }, status: :unprocessable_entity
        end
    end

    def destroy
        user = User.where(email: params[:user_email]).first
        requests = Request.where(user_id: params[:user_email])
        messages = MessageThread.where(thread_owner: params[:user_email])
        participant = Participant.where(user_id: params[:user_email])
        
        user.destroy
        requests.destroy_all
        messages.destroy_all
        participant.destroy_all
    end

    private
    def sign_up_params
        params.permit(:firstname, :lastname, :email, :password, :username, :idcard, :address)
    end
end
