class User < ApplicationRecord
  has_many :plays

  def get_total_score(game_id)
    plays.where(game_id: game_id).sum(:score)
  end
end
