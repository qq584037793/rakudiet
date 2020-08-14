class User < ApplicationRecord
  has_many :cooks, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Cook.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
  
  def follow(other_user)
    following << other_user
  end

  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

 
  def following?(other_user)
    following.include?(other_user)
  end
               
  def followed_by?(other_user)
    followers.include?(other_user)
  end


  
  private
    def downcase_email
      self.email = email.downcase
    end
    

end