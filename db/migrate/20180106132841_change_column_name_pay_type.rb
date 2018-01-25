class ChangeColumnNamePayType < ActiveRecord::Migration
  def change
    rename_column :pay_slips, :type, :pay_type
  end
end
