class User < ApplicationRecord

  # Association
  has_many :drawings, dependent: :destroy
  has_secure_token :name

  # Validations
  validates_presence_of :ip_address

  # Scopes
  scope :by_drawing_summary, -> { User.includes(:drawings) }

end
