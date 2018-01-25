class ChangeColumnDateToString < ActiveRecord::Migration
  def change
    change_column :user_pay_slips, :pay_month, :string
  end
end
