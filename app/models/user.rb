class User < ActiveRecord::Base
  has_secure_password
  has_many :networks
  has_many :colleagues, :through => :networks
  has_many :inverse_networks, :class_name => "Networks", :foreign_key => "colleague_id"
  has_many :inverse_colleagues, :through => :inverse_networks, source: :user
  has_many :invitations

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :description, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

end
