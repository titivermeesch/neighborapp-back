class ChatLinkController < ApplicationController
    def show
        contributions = Participant.where(user_id: params[:id])
        all = Request.where(id: contributions.map(&:id_request))
        m = MessageThread.where(id_request: all.map(&:id))
        render json: {
                status: 'SUCCESS',
                message: 'MessageThreads fetched',
                data: m
            }, status: :ok
    end
end
