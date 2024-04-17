class PiggybanksController < ApplicationController
  
  before_action :authenticate_user!

  before_action :check_user_is_owner, only: [:edit, :update, :destroy, :deposit, :withdraw, :restore_goal]
  
  def new
    @goal = Piggybank.new
  end
  
  def create
    @goal = Piggybank.new(goal_params)
    @goal.user = current_user
    
    if (@goal.save)
      redirect_to app_path, success: "New goal created!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @goal = Piggybank.find(params[:id].to_i)
  end
  
  def update
    @goal = Piggybank.find(params[:id].to_i)
    
    if @goal.update(goal_params)
      redirect_to app_path, success: "Goal Updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    goal = Piggybank.find(params[:id].to_i)
    goal.deleted = true
    goal.save
    redirect_to app_path, notice: "Goal deleted"
  end
  
  def deposit
    goal = Piggybank.find(params[:id].to_i)
    amount_to_add = amount_params[:amount].to_d
    
    if (goal.current_amount + amount_to_add) > goal.goal_amount
      redirect_to app_path, alert: "You cannot add that much to the piggybank! Try a smaller amount"
      return
    end
    
    goal.current_amount = goal.current_amount + amount_to_add
    goal.save
    redirect_to app_path
  end
  
  def withdraw
    goal = Piggybank.find(params[:id].to_i)
    amount_to_remove = amount_params[:amount].to_d
    
    if (amount_to_remove > goal.current_amount)
      redirect_to app_path, alert: "You cannot take that much out! Try removing a smaller amount"
      return
    end

    goal.current_amount = goal.current_amount - amount_to_remove
    goal.save
    
    redirect_to app_path
  end

  def restore
    @deleted_piggybanks = current_user.piggybanks.where(deleted: true, updated_at: (Date.today - 30.days).. ).order(:updated_at)
  end

  def restore_goal
    goal = Piggybank.find(params[:id].to_i)
    
    if goal
      goal.deleted = false
      if goal.save
        redirect_to app_path, notice: "Goal restored!"
        return
      end
    end

    redirect_to app_path, notice: "There was an issue when restoring that Goal, please try again"
  end
  
  private
  def check_user_is_owner

    goal = Piggybank.find(params[:id].to_i)
    if current_user != goal.user
      redirect_to app_path, error: "You can't access that page", status: :unauthorized
    end
  end

  def goal_params
    params.require(:piggybank).permit(:name, :current_amount, :goal_amount, :exclude_from_totals)
  end
  
  def amount_params
    params.require(:piggybank).permit(:amount)
  end
end
