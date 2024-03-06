class HomesController < ApplicationController

  before_action :authenticate_user!

  def index
    @bills = current_user&.admin_bills
  end

  def pay
    @bill = Admin::Bill.find(params[:id])
    @bill.update(paid: true)
    redirect_to root_path
  end


end