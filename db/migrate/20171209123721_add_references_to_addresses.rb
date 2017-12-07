class AddReferencesToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :user, index: true, foreign_key: true
    add_reference :addresses, :organization, index: true, foreign_key: true
  end
end
