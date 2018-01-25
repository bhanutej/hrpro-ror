module UserPaySlipHelper
  def user_payslip_years
    @user_pay_slips.group_by{|e| [e.pay_year]}
  end

  def months
    { :JAN => 1, :FEB => 2, :MAR => 3, :APR => 4, :MAY => 5, :JUN => 6, :JUL => 7, :AUG => 8, :SEP => 9, :OCT => 10, :NOV => 11, :DEC => 12 }
  end
end
