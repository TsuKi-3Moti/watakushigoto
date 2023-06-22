class Answer < ApplicationRecord

  belongs_to :question

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_many :relationships, foreign_key: "answer_id", dependent: :destroy
  has_many :tags, through: :relationships

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def input_tag_name
    tags.pluck(:name).join(",")
  end

  # def self.tag_names
  #   pluck(:name).join(",").split(/[，|,|　| ]/).map(&:to_s)
  # end

  def self.search_for(word)
    Answer.where("opinion LIKE ?", "%" + word + "%")
  end

end
