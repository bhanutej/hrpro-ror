class UserPaySlip < ActiveRecord::Base
  belongs_to :user
  belongs_to :pay_slip
end
