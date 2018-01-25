class PaySlipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pay_slip_element = org_pay_slips.new
  end

  def new
    # @organization = get_organization(params[:id])
    # @user = User.new
  end

  def create
    @pay_slip = org_pay_slips.new(payslip_params)
    @pay_slip.save
  end

  def edit
    @pay_slip_element = org_pay_slips.where(id: params[:id]).first
  end

  def update
    @pay_slip_element = org_pay_slips.where(id: params[:id]).first
    @pay_slip_element.update_attributes(payslip_params) if @pay_slip_element.present?
  end

  private

  def org_pay_slips
    @current_organization.pay_slips
  end

  def payslip_params
    params.require(:pay_slip).permit(:name, :percent, :pay_type, :remark)
  end

end
