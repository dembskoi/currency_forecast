class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :rememberable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable, :validatable
end
