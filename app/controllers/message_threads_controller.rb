class MessageThreadsController < ApplicationController
    acts_as_token_authentication_handler_for User
    
    def index
        threads = MessageThread.all
        render json: {
                status: 'SUCCESS',
                message: 'Loaded all threads',
                data: threads
            }, status: :ok
    end

    def create
        thread = MessageThread.new(thread_params)
        if(thread.save)
            render json: {
                    status: 'SUCCESS',
                    message: 'Thread created',
                    data: thread
                }, status: :created
            else 
                render json: {
                    status: 'ERROR',
                    message: 'Thread not created',
                    data: thread.errors
                }, status: :unprocessable_entity
        end
    end

    def show
        threads = MessageThread.where(thread_owner: params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Thread list fetched',
            data: threads,
        }, status: :ok
    end

    private def thread_params
        params.permit(:thread_owner, :title, :id_request)
    end
end
