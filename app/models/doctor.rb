class Doctor < ApplicationRecord
  has_many :appointments,dependent: :destroy
  has_many :availables
  has_one_attached :avatar
  has_many :address, as: :addressable
  has_many :skills
  has_many :reviews
end
