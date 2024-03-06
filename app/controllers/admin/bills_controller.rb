class Admin::BillsController < ApplicationController
  before_action :set_admin_bill, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!

  def index
    @admin_bills = Admin::Bill.all
  end



  def new
    @admin_bill = Admin::Bill.new
  end

  def edit
  end

  def create
    @admin_bill = Admin::Bill.new(admin_bill_params)

    respond_to do |format|
      if @admin_bill.save
        format.html { redirect_to admin_bills_url, notice: "Bill was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_bill.update(admin_bill_params)
        format.html { redirect_to admin_bills_url, notice: "Bill was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_bill.destroy

    respond_to do |format|
      format.html { redirect_to admin_bills_url, notice: "Bill was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_bill
      @admin_bill = Admin::Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_bill_params
      params.require(:admin_bill).permit(:user_id, :bill_date, :amount, :paid)
    end
end
