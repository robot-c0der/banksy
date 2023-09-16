class PiggybanksController < ApplicationController
  
  before_action :authenticate_user!

  before_action :check_user_is_owner, only: [:edit, :update, :destroy, :deposit, :withdraw]
  
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
    @goal = Piggybank.find(params[:id])
  end
  
  def update
    @goal = Piggybank.find(params[:id])
    
    if @goal.update(goal_params)
      redirect_to app_path, success: "Goal Updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    goal = Piggybank.find(params[:id])
    goal.destroy
    redirect_to app_path, notice: "Goal deleted"
  end
  
  def deposit
    goal = Piggybank.find(params[:id])
    amount_to_add = amount_params[:amount].to_d
    
    if amount_to_add > (goal.goal_amount - goal.current_amount)
      redirect_to app_path, status: :bad_request
    end
    
    goal.current_amount = goal.current_amount + amount_to_add
    goal.save
    redirect_to app_path
  end
  
  def withdraw
    goal = Piggybank.find(params[:id])
    amount_to_remove = amount_params[:amount].to_d
    
    if amount_to_remove > goal.current_amount
      redirect_to app_path, status: :bad_request
    end
    goal.current_amount = goal.current_amount - amount_to_remove
    goal.save
    
    redirect_to app_path
  end
  
  private
  def check_user_is_owner
    goal = Piggybank.find(params[:id])
    if current_user != goal.user
      redirect_to app_path, error: "You can't access that page", status: :unauthorized
    end
  end

  def goal_params
    params.require(:piggybank).permit(:name, :current_amount, :goal_amount)
  end
  
  def amount_params
    params.require(:piggybank).permit(:amount)
  end
end
