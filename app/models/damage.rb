class Damage < ApplicationRecord
  NATURE = ["carrosserie", "mecanique"]
  MECANIQUE = ["La batterie", "l'embrayage", "La boite de vitesse", "Le moteur", "Les disques de freins", "L'alimentation", "Les éclairages", "Autre"]
  CARROSSERIE = ["Une fracture", "Une déformation", "Une rayure", "Une corosion", "Autre"]
  belongs_to :car
  mount_uploader :picture_1, PhotoUploader
  mount_uploader :picture_2, PhotoUploader
  mount_uploader :picture_3, PhotoUploader
  validates :nature, presence: true, inclusion: { in: NATURE }
  validates :title, presence: true
end
