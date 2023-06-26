class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, length: { maximum: 30 }, presence: true

  def self.search_for(word)
    Question.where("title LIKE ?", "%" + word + "%")
  end

end
