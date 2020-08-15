class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :cook
    validates :user_id, presence: true
    validates :cook_id, presence: true  
end
