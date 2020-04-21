class Patient < ApplicationRecord
    has_many :appointments
    has_one_attached :avatar
    has_many :address, as: :addressable
    has_many :reviews
  end
  