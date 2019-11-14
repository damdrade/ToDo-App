class User < ApplicationRecord
	has_many :todo_lists
	has_many :favorite_lists
	has_many :favorites, through: :favorite_lists, source: :todo_list

	validates :email, presence: true

  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
