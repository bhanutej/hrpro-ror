class User < ActiveRecord::Base
  extend Enumerize
  has_many :subordinates, class_name: "User", foreign_key: "manager_id"
  belongs_to :manager, class_name: "User"
  has_one :address
  accepts_nested_attributes_for :address
  has_many :user_pay_slips
  belongs_to :organization, dependent: :destroy, counter_cache: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :email, format: { with: Devise::email_regexp, message: "Please provide valid email"  }
  validates :first_name, presence: true
  validates_presence_of :last_name
  validates_presence_of :account_number
  NUMBER_REGEXP = /\A[+-]?\d+\z/
  validates :account_number, format: { with: NUMBER_REGEXP, message: "Please provide valid account number"  }
  validates_presence_of :emp_id
  validates_presence_of :bank_name
  validates_presence_of :date_of_birth
  validates_presence_of :blood_group
  validates_presence_of :contact
  CONTACT_NUMBER_REGEXP = /\A[0-9]{10}\z/
  validates :contact, format: { with: CONTACT_NUMBER_REGEXP, message: "Please provide valid phone number"  }
  validates_uniqueness_of :contact
  enumerize :role, in: %i(super_admin admin manager user), default: :user

  def name
    self.first_name + " " + self.last_name
  end
end
