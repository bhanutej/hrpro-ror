class AddRemarksToPaySlips < ActiveRecord::Migration
  def change
    add_column :pay_slips, :remark, :text
  end
end
