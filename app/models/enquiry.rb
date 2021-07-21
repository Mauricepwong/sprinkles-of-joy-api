class Enquiry < ApplicationRecord
    belongs_to :topic
    belongs_to :user

    def convert_enquiry
        return {
            user: self.user.username,
            name: self.name,
            topic: self.topic.name,
            message: self.message,
            posted: self.created_at,
            edited: self.updated_at
        }
    end
end
