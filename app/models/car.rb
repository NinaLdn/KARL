class Car < ApplicationRecord
  belongs_to :user
  mount_uploader :photo_1, PhotoUploader
  mount_uploader :photo_2, PhotoUploader
  mount_uploader :photo_3, PhotoUploader
end



