class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  validates_presence_of :street_address1
  validates_presence_of :street_address2
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :postal_code
  validates_presence_of :country
  # validates_presence_of :landmark
  # validates_presence_of :address_type
end
