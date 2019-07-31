class MessagesController < ApplicationController
    acts_as_token_authentication_handler_for User
    
    def create
        message = Message.new(message_params)
        if(message.save)
            render json: {
                    status: 'SUCCESS',
                    message: 'Message saved',
                    data: message
                }, status: :created
            else 
                render json: {
                    status: 'ERROR',
                    message: 'Message not saved',
                    data: message.errors
                }, status: :unprocessable_entity
        end
    end

    def show
        messages = Message.where(thread_id: params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Messages fetched',
            data: messages,
        }, status: :ok
    end

    private def message_params
        params.permit(:thread_id, :message_author, :content)
    end
end
