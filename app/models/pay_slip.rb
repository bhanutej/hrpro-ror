class PaySlip < ActiveRecord::Base
  has_many :user_pay_slips
  belongs_to :organization
  before_validation :strip_content

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :organization
  validates :percent, :allow_blank => true, numericality: { only_integer: true }

  private

  def strip_content
    self.name = self.name.strip unless self.name.nil?
  end
end
