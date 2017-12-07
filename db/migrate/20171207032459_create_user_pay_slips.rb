class CreateUserPaySlips < ActiveRecord::Migration
  def change
    create_table :user_pay_slips do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pay_slip, index: true, foreign_key: true
      t.string :percent
      t.integer :amount
      t.datetime :pay_month

      t.timestamps null: false
    end
  end
end
