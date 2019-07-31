class Participant < ApplicationRecord
    validates :id_request, presence: true
    validates :user_id, presence: true, uniqueness: {scope: :id_request}
end
