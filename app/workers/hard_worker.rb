class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(time)
    puts "SIDEKIQ WORKER GENERATING A REPORT FROM #{time}"
  end
end
