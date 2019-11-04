require 'faker'

User.destroy_all

10.times do 
	user = User.create(
		email: Faker::Internet.free_email,
		encrypted_password: Faker::Lorem.words,
		description: Faker::Quote.yoda,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name)
end