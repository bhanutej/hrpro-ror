class AddTypeToPaySlips < ActiveRecord::Migration
  def change
    change_column :pay_slips, :type, :boolean, default: false #type: addition(true)/deduction(false)
  end
end
