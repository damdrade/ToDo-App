class TodoList < ApplicationRecord
	belongs_to :user
	has_many :tasks
	has_many :favorite_lists
	has_many :favorited_by, through: :favorite_lists, source: :user

	accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
