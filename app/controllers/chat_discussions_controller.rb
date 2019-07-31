class ChatDiscussionsController < ApplicationController
    acts_as_token_authentication_handler_for User
    
    def show
        thread = MessageThread.where(id: params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Thread fetched',
            data: thread,
        }, status: :ok
    end
end
