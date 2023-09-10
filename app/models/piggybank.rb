class Piggybank < ApplicationRecord
  belongs_to :user

  before_validation :change_nils_to_zero

  validates_comparison_of :current_amount, greater_than_or_equal_to: 0
  validates_comparison_of :goal_amount, greater_than: 0
  validates_comparison_of :current_amount, less_than_or_equal_to: :goal_amount
  validates :name, uniqueness: {scope: @user}
  
  def current_percent
    percent = ActiveSupport::NumberHelper::number_to_rounded(((current_amount / goal_amount) * 100), precision: 0)
    return percent
  end

  private

  def change_nils_to_zero
    current_amount = 0 if current_amount.nil?
    goal_amount = 0 if goal_amount.nil?
  end
end
