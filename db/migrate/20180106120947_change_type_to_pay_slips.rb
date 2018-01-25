class ChangeTypeToPaySlips < ActiveRecord::Migration
  def change
    change_column :pay_slips, :type, :boolean, default: false
  end
end
