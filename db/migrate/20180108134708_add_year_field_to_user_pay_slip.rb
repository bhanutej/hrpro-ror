class AddYearFieldToUserPaySlip < ActiveRecord::Migration
  def change
    add_column :user_pay_slips, :pay_year, :integer
  end
end
