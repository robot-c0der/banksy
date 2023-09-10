class Piggybank < ApplicationRecord
  belongs_to :user

  def current_percent
    return (current_amount / goal_amount) * 100
  end
end
