class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:confirmable, --> Remove confirmable for now
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_many :questions

  validates_presence_of :email, :first_name, :last_name
end
