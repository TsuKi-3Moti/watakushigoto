class Favorite < ApplicationRecord

  belongs_to :user

  belongs_to :answer

  # いいね機能のデザインパターン
  enum design: {
    handshake: 0,
    applause: 1,
    heart: 2,
    realize: 3,
    crying: 4
  }

end
