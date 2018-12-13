class Damage < ApplicationRecord
  NATURE = ["carrosserie", "mecanique"]
  MECANIQUE = ["L'embrayage", "La boite de vitesse", "La courroie\nde distribution", "Autre"]
  CARROSSERIE = ["Une rayure", "Une bosse", "Autre"]
  belongs_to :car
  mount_base64_uploader :picture_1, PhotoUploader
  mount_base64_uploader :picture_2, PhotoUploader
  mount_base64_uploader :picture_3, PhotoUploader
  validates :nature, presence: true, inclusion: { in: NATURE }
  validates :title, presence: true
end
