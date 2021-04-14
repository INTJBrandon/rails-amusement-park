class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    validates :name, presence: true, uniqueness: true

    def mood
        if !self.admin
            self.happiness > self.nausea ? "happy" : "sad"
        end
    end
end