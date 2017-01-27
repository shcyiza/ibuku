class User < ActiveRecord::Base
	has_many :origins
	has_many :reviews
	has_many :ideas
	has_many :works
	has_many :problematics
	has_many :notes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
