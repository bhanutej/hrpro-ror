class UserPaySlipsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @user = @current_organization.users.where(id: params[:user_id]).first
    @user_pay_slip = @user.user_pay_slips.new if @user.present?
  end

  def create
    @user_pay_slip = UserPaySlip.create(user_pay_params)
  end

  def user_payslips
    @user_id = params[:user_id]
    @user_pay_slips = UserPaySlip.where(user_id: @user_id)
  end

  private

  def user_pay_params
    params.permit(:amount, :pay_slip_id, :pay_month, :pay_year, :user_id)
  end

end
