class Car < ApplicationRecord
  belongs_to :user
  has_many :damages
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader


  validates :registration_number, :with => /^[a-zA-Z]{1,2}[0-9]{1,3}[a-zA-Z]{1,2}/, :on => create
  validates :estimated_kilometers, presence: true
end

