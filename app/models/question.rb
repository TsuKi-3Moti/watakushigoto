class Question < ApplicationRecord

  belongs_to :user

  has_many :answers, dependent: :destroy

  validates :title, presence: true

  #投稿の公開ステータス (0= 公開/1= 下書き)
  enum status: { published: 0, draft: 1 }

  def self.search_for(word)
    Question.where("title LIKE ?", "%" + word + "%")
  end

end
