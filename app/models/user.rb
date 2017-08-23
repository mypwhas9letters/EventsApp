class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  belongs_to :location
  has_secure_password
  # has_many :events, foreign_key: 'host_id'
  validates :username, uniqueness: true
  validates :first_name,:last_name,:bio, :username, :password_digest, :location_id, presence: true

  def add_event(event)
    if !self.events.include?(event)
      self.events << event
    end
  end

  def delete_event(event)
    if self.events.include?(event)
      self.events.delete(event)
    end
  end

end
