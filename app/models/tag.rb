class Tag < ApplicationRecord

  has_many :relationships, foreign_key: "tag_id", dependent: :destroy
  has_many :answers, through: :relationships

  validates :name, uniqueness: true

  def self.tag_names
    pluck(:name).join(",").split(/[,，、\s　]+/).map(&:to_s)
  end

end
