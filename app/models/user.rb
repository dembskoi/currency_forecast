class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :calculations

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_username

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions[:username].nil?
      where(conditions).first
    else
      where(username: conditions[:username]).first
    end
  end

  private

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end
end
