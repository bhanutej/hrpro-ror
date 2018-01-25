class Organization < ActiveRecord::Base
  before_validation :strip_content

  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  has_many :users
  accepts_nested_attributes_for :users, allow_destroy: true
  has_many :pay_slips
  validates_presence_of :name
  validates_presence_of :estb_date
  validates_presence_of :description
  validates_presence_of :domain
  validates_uniqueness_of :domain

  private
    def strip_content
      self.name = self.name.strip unless self.name.nil?
      self.domain = self.domain.strip unless self.domain.nil?
    end
end
