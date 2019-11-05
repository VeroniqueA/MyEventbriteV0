class Event < ApplicationRecord
#un event rassemble plusieurs personnes
has_many :attendances
has_many :users, through: :attendances
#un event a un administrateur : à coder
belongs_to :admin, class_name: "User"

validate :divisible_by_five, :is_in_future?

validates :start_date, 
    presence: {message: "Merci de saisir une date !"} #,
    #if is_in_the_futur?
    #il est impossible de créer ou modifier un événement dans le passé.
    validates :duration, 
    presence: {message: "Merci de saisir une durée !"}
    validates :title, 
    presence: {message: "Merci de saisir un titre !"},
    length: {minimum: 5, maximum: 140, message: "Le titre doit être entre 5 et 140 caractères"}
    validates :description, 
    presence: {message: "Merci de saisir un contenu !"},
    length: {minimum: 20, maximum: 1000, message: "La description doit être entre 20 et 1000 caractères"}
    validates :price,
    presence: {message: "Merci de saisir un prix !"},
    numericality: { in: 1..1000 }
    validates :location, 
    presence: {message: "Merci de saisir une ville !"}


    def divisible_by_five
      if (self.duration % 5) != 0
        self.errors[:base] << "La durée doit être un multiple de 5"
      end
    end

    def is_in_future?
      self.start_date  >=  Date.today
    end
  end



	# validates :start_date, presence: true
	# validate :is_in_future
	# validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
	# validate :divisible_by_five
	# validates :title, presence: true, length: { in: 5..140 }
	# validates :description, presence: true, length: { in: 20..1000 }
	# validates :price, presence: true, numericality: { in: 1..1000 }
	# validates :location, presence: true

	# def divisible_by_five
	#  	if (self.duration % 5) != 0
	#       self.errors[:base] << "Le prix doit être divisible par 5 !"
	#    	end
 # 	end

 # 	def is_in_future
	#  	if self.start_date < Time.now
	#       self.errors[:base] << "La date doit être postérieure au moment présent !"
	#    	end
 # 	end
# end
