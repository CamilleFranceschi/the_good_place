class Review < ApplicationRecord
  validates :name, presence: :true
  validates :content, presence: :true
  belongs_to :place
end
