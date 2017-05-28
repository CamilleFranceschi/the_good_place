class Place < ApplicationRecord
  validates :description, presence: :true, uniqueness: :true
  validates :name, presence: :true, uniqueness: :true
  validates :address, presence: :true

  has_attachments :photos, maximum: 8
  belongs_to :user
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  acts_as_votable
end
