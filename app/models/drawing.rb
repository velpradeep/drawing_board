class Drawing < ApplicationRecord
  # Association definition
  belongs_to :user

  # Validations
  validates_presence_of :drawing_area, :color_code

  # Scopes
  scope :by_drawing_area, -> {joins(:user).select("drawings.*, users.name as user_name").group_by(&:drawing_area) }
end
