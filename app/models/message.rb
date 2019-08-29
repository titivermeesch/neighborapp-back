class Message < ApplicationRecord
    validates :thread_id, presence: true
    validates :message_author, presence: true
    validates :content, presence: true, length: {maximum: 150}
    validates :date, presence: true
    validates :type, presence: true
end
