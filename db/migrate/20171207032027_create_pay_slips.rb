class CreatePaySlips < ActiveRecord::Migration
  def change
    create_table :pay_slips do |t|
      t.string :name
      t.references :organization, index: true, foreign_key: true
      t.string :percent

      t.timestamps null: false
    end
  end
end
