class AddLandmarkAndAddressTypeToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :landmark, :string
    add_column :addresses, :address_type, :string
  end
end
