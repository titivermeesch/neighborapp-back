class Message < ApplicationRecord
    validates :thread_id, presence: true
    validates :message_author, presence: true
    validates :content, presence: true
    validates :date, presence: true
end
