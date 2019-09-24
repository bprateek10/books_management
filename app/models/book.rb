class Book < ApplicationRecord

	#Associations
	has_many :author_books, dependent: :destroy
	has_many :authors, through: :author_books

	#Validations
	validates :title, presence: true
	validates :title, uniqueness: true
end
