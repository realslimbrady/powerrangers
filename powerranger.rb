class Person
		attr_reader :name	
	def initialize(name)
		@name = name
		@caffine_level = 0
	end

	def drink_coffee
		@caffine_level += 2
		puts "#{@name} drank coffee, #{@name}'s caffine level increased to #{@caffine_level}."
	end

	def scream
		puts "#{@name}: AAAHHHHHHHHH!"
	end

	def run
		puts "#{@name} runs away"
	end

end

class PowerRanger < Person
	attr_reader :strength, :color, :name
	attr_accessor :caffine_level
	@@rangers = []
	def initialize(name, color)
		@@rangers << self
		super(name)
		@color = color
		puts "You added a #{@color} ranger named #{@name}"
		
	end

	def punch(name)
		@strength = rand(1..10)
		if @caffine_level < 1
			puts "#{@name} doesn't have enough caffine to punch #{name.name}!"
		else
			@caffine_level -= 1
			if @strength > 5
				puts "#{@name} punched #{name.name} with a strength of #{strength}, #{name.name} was catapulted into the air!"
			else 
				puts "#{@name} punched #{name.name} with a strength of #{@strength}!"
				name.scream
				name.run
			end
		end
	end

	def self.use_megazord(name)
		#megazord checks to see if the combined caffine level of the rangers is above 15
		#if the rangers energy is sufficient. megazord damages the target.
		@caffine_array = []
		@@rangers.each do |item|
			if item.class == PowerRanger
				@caffine_array << item.caffine_level
				@ranger_names << item.name
			end
		end

		if @caffine_array.inject(0){|a, b| a + b} > 15
			puts "The rangers united to use the megazord against #{name.name}. Megazord does 500 damage! #{name.name} has been critically injured!"
		else
			puts "The rangers don't have enough energy to use megazord!"
		end
	end
end

 class Evil_Ninja < Person
	attr_reader :strength, :evilness, :caffine_level 

	def initialize(name)
		super(name)
		@evilness = rand(1..10)
		puts "You added an Evil Ninja named #{@name}!"
	end

	def punch(name)
		@strength = rand(1..8)
		if @caffine_level < 1
			puts "#{@name} doesn't have enough caffine to punch #{name.name}!"
		else
			@caffine_level -= 1
			if @strength > 5
				puts "#{@name} punched #{name.name} with a strength of #{strength}, #{name.name} was catapulted into the air!"
			else 
				puts "#{@name} punched #{name.name} with a strength of #{@strength}!"
				name.scream
				name.run
			end
		end
	end

	def mayhem(name)
		if @caffine_level < 2
			puts "#{@name} doesn't have enough caffine to use mayhem on #{name.name}!"
		 else
		 	@caffine_level -= 2
		 	name.caffine_level = 0
		 	puts "Evil Ninja #{@name} used mayhem! #{name.name}'s caffine level has been reduced to #{name.caffine_level}!"
		end
	end
end






def fight_scene
	bob = Person.new("Bob")
	jim = Person.new("Jim")
	tommy = PowerRanger.new("Tommy", "Green")
	billy = PowerRanger.new("Billy", "Blue")
	rita = Evil_Ninja.new("Rita Repulsa")
	scorpina = Evil_Ninja.new("Scorpina")

	bob.drink_coffee
	jim.drink_coffee
	tommy.drink_coffee
	tommy.drink_coffee
	tommy.drink_coffee
	tommy.drink_coffee
	billy.drink_coffee
	PowerRanger.use_megazord(scorpina)
	rita.drink_coffee
	rita.drink_coffee
	rita.mayhem(billy)
	billy.drink_coffee
	billy.drink_coffee
	billy.drink_coffee
	billy.drink_coffee
	rita.punch(jim)
	scorpina.drink_coffee
	scorpina.drink_coffee
	PowerRanger.use_megazord(rita)
	scorpina.punch(bob)
	tommy.punch(scorpina)
end
