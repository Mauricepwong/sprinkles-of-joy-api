class Enquiry < ApplicationRecord
    belongs_to :topic
    belongs_to :user

    def convert_enquiry
        return {
            user: self.user.username,
            topic: self.category.name,
            message: self.created_at,
            posted: self.created_at,
            edited: self.updated_at
        }
end
