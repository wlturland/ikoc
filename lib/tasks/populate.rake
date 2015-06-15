namespace :db do

	desc "Clear the db and fill with sample data"
	task :populate => :environment do 
		require 'populator'
		require 'faker'

		# clear out data
			# acceptable
		# Owner.destroy_all
		# Dog.destroy_all
			# best practice
		[Product].each(&:destroy_all)


		#begin population
		Product.populate 20 do |product|
			product.name = Faker::Commerce.product_name
			product.price = Faker::Commerce.price
			product.quantity = rand(2..50)
			product.description = Faker::Lorem.sentences(3)
			product.category_id = rand(1..5)
		end #population
	end #task

end
