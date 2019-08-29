class Request < ApplicationRecord
    validates :user_id, presence: true
    validates :title, presence: true
    validates :request_type, presence: true
    validates :description, presence: true, length: {maximum: 300}
    validates :date, presence: true
    validates :required_people, presence: true
    validates :x, presence: true
    validates :y, presence: true
    validates :status, presence: true
end
