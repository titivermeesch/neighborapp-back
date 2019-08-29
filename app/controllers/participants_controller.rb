class ParticipantsController < ApplicationController
    acts_as_token_authentication_handler_for User

    def create
        participant = Participant.new(participant_params)
        request = Request.find(params[:id_request])

        if(request.required_people == 1)
            request.update_attribute(:status, "closed")
            HardWorker.perform_in(24.hours, :id_request)
        end

        request.update_attribute(:required_people, request.required_people - 1)
        

        if(participant.save)
            render json: {
                status: 'SUCCESS',
                message: 'Participant link created',
                data: participant
            }, status: :created

            puts "-------------------------"
            puts "-------------------------"
            puts "-------------------------"
            puts "-------------------------"
            puts "-------------------------"
            m = Message.new()
            m.thread_id = MessageThread.where(id_request: participant.id_request).first
            m.message_author = participant.user_id
            m.content = participant.user_id + " is now participating"
            m.date = Time.now
            m.message_type = "alert"
            m.save
            puts "-------------------------"
            puts "-------------------------"
            puts "-------------------------"
            puts "-------------------------"
            puts "-------------------------"
        else 
            render json: {
                status: 'ERROR',
                message: 'Participant link not created',
                data: participant.errors
            }, status: :unprocessable_entity
        end
    end

    def show
        participants = Participant.where(id_request: params[:id])
        render json: {
            status: 'SUCCESS',
            message: 'Participants fetched',
            data: participants
        }, status: :ok
    end

    def destroy
        participant = Participant.where(id_request: params[:id_request], user_id: params[:user_id]).first
        request = Request.find(params[:id_request])

        if(request.required_people == 0)
            request.update_attribute(:status, "open")
        end

        request.update_attribute(:required_people, request.required_people + 1)

        participant.destroy
    end

    private def participant_params
        params.permit(:id_request, :user_id)
    end
end
