class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.date :estb_date
      t.text :description
      t.integer :users_count, default: 0
      t.boolean   :active,  default: true
      t.datetime  :deleted_at
      t.timestamps null: false
    end
  end
end
