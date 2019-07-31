class RequestsController < ApplicationController
    acts_as_token_authentication_handler_for User

    def index
        requests = Request.all
        render json: {
            status: 'SUCCESS',
            message: 'Requests fetched',
            data: requests
        }, status: :ok
    end

    def create
        request = Request.new(request_params)

        if(request.save)
            render json: {
                status: 'SUCCESS',
                message: 'Request created',
                data: request
            }, status: :created
        else 
            render json: {
                status: 'ERROR',
                message: 'Request not created',
                data: request.errors
            }, status: :unprocessable_entity
        end
    end

    def show
        requests = Request.where(user_id: params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Request list fetched',
            data: requests,
        }, status: :ok
    end

    def destroy
        request = Request.find(params[:id])
        thread = MessageThread.where(id_request: params[:id]).first
        participants = Participant.where(id_request: params[:id])
        request.destroy
        thread.destroy
        participants.destroy_all
    end

    private def request_params
        params.permit(:user_id, :title, :request_type, :description, :date, :required_people, :x, :y, :status)
    end
end
