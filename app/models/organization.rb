class Organization < ActiveRecord::Base
  has_many :addresses
  has_many :users
  has_one :pay_slip
  validates_presence_of :name
  validates_presence_of :estb_date
  validates_presence_of :description
end
