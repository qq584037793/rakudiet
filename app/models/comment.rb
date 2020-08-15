class Comment < ApplicationRecord
    belongs_to :cook
    validates :user_id, presence: true
    validates :cook_id, presence: true
    validates :content, presence: true, length: { maximum: 50 }
end
