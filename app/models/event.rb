class Event < ApplicationRecord
#un event rassemble plusieurs personnes
	has_many :attendances
	has_many :users, through: :attendances
#un event a un administrateur : à coder ???

	validates :start_date, presence: true
	validate :is_in_future
	validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	validate :divisible_by_five
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: { in: 20..1000 }
	validates :price, presence: true, numericality: { in: 1..1000 }
	validates :location, presence: true

	def divisible_by_five
	 	if (self.duration % 5) != 0
	      self.errors[:base] << "Le prix doit être divisible par 5 !"
	   	end
 	end

 	def is_in_future
	 	if self.start_date < Time.now
	      self.errors[:base] << "La date doit être postérieure au moment présent !"
	   	end
 	end
end
