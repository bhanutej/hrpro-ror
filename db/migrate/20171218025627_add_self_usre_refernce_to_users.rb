class AddSelfUsreRefernceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_id, :integer, index: true
  end
end
