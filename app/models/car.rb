class Car < ApplicationRecord
  belongs_to :user
  has_many :damages
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
  validates :registration_number, presence: true
  validates :estimated_kilometers, presence: true
end

