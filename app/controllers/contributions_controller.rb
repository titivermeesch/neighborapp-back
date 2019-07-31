class ContributionsController < ApplicationController
    acts_as_token_authentication_handler_for User

    def index
        requests = Request.all
        render json: {
            status: 'SUCCESS',
            message: 'Requests fetched',
            data: requests,
        }, status: :ok
    end
    
    def show
        contribution = Request.where(id: params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Contribution fetched',
            data: contribution,
        }, status: :ok
    end
end
