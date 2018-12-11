class Damage < ApplicationRecord
  NATURE = ["Carrosserie", "Mécanique"]
  MECANIQUE = ['La batterie', 'embrayage', 'La boite de vitesse', 'La courroie de distribution', 'L électronique du moteur', 'Les disques de freins', 'L alimentation (pompe à injection)', 'Les éclairages (phares, feux, ampoules)', 'Le chauffage, la climatisation', 'Autre']
  CARROSSERIE = ['Un trou ou une fracture', 'Une déformation suite à un choc ', 'Une rayure', 'Une corosion', 'Autre']
  belongs_to :car
  mount_uploader :picture_1, PhotoUploader
  mount_uploader :picture_2, PhotoUploader
  mount_uploader :picture_3, PhotoUploader
  validates :nature, presence: true, inclusion: { in: NATURE }
  validates :titre, presence: true
end
