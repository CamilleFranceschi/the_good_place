class Place < ApplicationRecord
  validates :description, presence: :true, uniqueness: :true
  validates :name, presence: :true, uniqueness: :true
  validates :address, presence: :true

  has_attachments :photos, maximum: 8
end
