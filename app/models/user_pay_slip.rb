class UserPaySlip < ActiveRecord::Base
  belongs_to :user
  belongs_to :pay_slip
  validates_associated :user, :pay_slip
  validates_presence_of :pay_month
  validates_presence_of :amount

  validates :pay_year, presence: true
  validate :validate_pay_year_month

  validates :pay_slip, uniqueness: { scope: [:user, :pay_month, :pay_month] }

  private

  def validate_pay_year_month
    if user.date_of_join.strftime("%Y").to_i > pay_year
      self.errors.add(:pay_month, "Please provide valid year, Check join year")
    elsif user.date_of_join.strftime("%Y").to_i == pay_year && user.date_of_join.strftime("%m").to_i > pay_year
      self.errors.add(:pay_month, "Please provide valid month, Check join month")
    end
  end
end
