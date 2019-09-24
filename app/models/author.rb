class Author < ApplicationRecord

	#Associations
	has_many :author_books, dependent: :destroy
	has_many :books, through: :author_books

	#Validations
	validates :first_name, :last_name, :date_of_birth, presence: true
	
end
