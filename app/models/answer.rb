class Answer < ApplicationRecord

  belongs_to :question

  has_many :favorites, dependent: :destroy

  has_many :relationships, foreign_key: "answer_id", dependent: :destroy
  has_many :tags, through: :relationships, dependent: :destroy

  # validates :opinion, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def input_tag_name
    tags.pluck(:name).join(" ")
  end
end
