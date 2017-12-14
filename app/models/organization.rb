class Organization < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  has_many :users
  has_one :pay_slip
  validates_presence_of :name
  validates_presence_of :estb_date
  validates_presence_of :description
  validates_presence_of :domain
end
