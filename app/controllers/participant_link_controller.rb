class ParticipantLinkController < ApplicationController
    def show
        contributions = Participant.where(user_id: params[:id])
        all = Request.where(id: contributions.map(&:id_request))
        
        render json: {
                status: 'SUCCESS',
                message: 'Participant link created',
                data: all
            }, status: :ok
    end
end
