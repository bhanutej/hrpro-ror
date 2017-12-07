class PaySlip < ActiveRecord::Base
  has_many :user_pay_slips
  belongs_to :organization
end
