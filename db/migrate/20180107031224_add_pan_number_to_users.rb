class AddPanNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pan_number, :string
  end
end
