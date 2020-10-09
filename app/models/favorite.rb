class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :cook
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :cook_id, presence: true
end
