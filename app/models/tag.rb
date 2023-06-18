class Tag < ApplicationRecord

  has_many :relationships, foreign_key: "tag_id", dependent: :destroy
  has_many :answers, through: :relationships

  validates :name, uniqueness: true

end
