class MessageThread < ApplicationRecord
    validates :thread_owner, presence: true
    validates :title, presence: true
    validates :id_request, presence: true
end
