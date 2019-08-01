class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    request = Request.find(id)
    participant = Participant.where(id_request: id)
    if(request.required_people >= participant.length)
      request.destroy
      participant.destroy_all
    end
  end
end
