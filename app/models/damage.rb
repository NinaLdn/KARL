class Damage < ApplicationRecord
  belongs_to :car
  mount_uploader :picture_1, PhotoUploader
  mount_uploader :picture_2, PhotoUploader
  mount_uploader :picture_3, PhotoUploader
  validates :title, presence: true
end
