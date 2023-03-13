class Player
    attr_accessor :name, :health, :life_support, :skills, :equipment, :known_things
    def initialize(name)
        @name = name
        @health = 10
        @life_support = 10 
        @skills = []
        @equipment = []
        @known_things = []
    end
end

class Planet
    attr_accessor :name, :hostility, :temperature, :color, :water, :minerals, :plants, :places, :aliens, :animals
    def initialize()
        @name = nil
        @hostility = rand(10)
        @temperature = rand(180) - 40
        @color = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'black', 'white', 'brown'].sample
        @water = rand(100)
        @minerals = Array.new(rand(10)) { Mineral.new }
        @plants = Array.new(rand(10)) { Plant.new }
        @places = Array.new(rand(10)) { Place.new }
      #   @aliens = Array.new(rand(10)).each {|value| value = Mineral.new()}
        @animals = Array.new(rand(10)) { Animal.new }
    end
end

class Plant
      attr_accessor :name, :size, :color, :type, :flower, :edible, :poisonous, :hostility
    def initialize()
        @name = nil
        @size = ['tiny', 'small', 'medium', 'large', 'huge'].sample
        @color = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'black', 'white', 'brown'].sample
        @type = ['algae', 'kelp', 'seaweed', 'tree', 'bush', 'grass'].sample
        @flower = [true, false].sample
        @edible = [true, false].sample
        @poisonous = [true, false].sample
        @hostility = rand(10)
    end
end

class Animal
      attr_accessor :name, :size, :color, :type, :legs, :arms, :heads, :diet, :edible, :poisonous, :hostility
      def initialize()
          @name = nil
          @size = ['tiny', 'small', 'medium', 'large', 'huge'].sample
          @color = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'black', 'white', 'brown'].sample
          @type = ['fish', 'amphibian', 'reptile', 'mammal', 'bird', 'invertebrae'].sample
          @legs = rand(5)
          @arms = rand(5)
          @heads = rand(3)
          @diet = ['herbivore','omnivore','carnivore'].sample
          @edible = [true, false].sample
          @poisonous = [true, false].sample
          @hostility = rand(10)
      end
end

class Place
      attr_accessor :name, :size, :type, :population, :hostility
      def initialize()
            @name = nil
            @size = ['tiny', 'small', 'medium', 'large', 'huge'].sample
            @type = ['lake', 'river', 'ocean', 'mountain', 'cave', 'cliffside', 'abandoned building', 'city', 'shipwreck'].sample
            @population = rand(10000)
            @hostility = rand(10)
      end
end

class Mineral
      attr_accessor :name, :type, :color, :hardness, :melting_point
      def initialize()
            @name = nil
            @type = ['rock', 'crystal', 'metal'].sample
            @color = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'black', 'white', 'brown'].sample
            @hardness = rand(100)
            @melting_point = rand(1000)
      end
end

# Initialize a new game
puts 'Please enter a user name.'
new_player = Player.new(gets.chomp)

start_planet = Planet.new()

puts "Welcome, #{new_player.name}. You have landed onto a new and beautiful planet. The planet has a #{start_planet.color} color. The temperature is #{start_planet.temperature} degrees Fahrenheit. There are many animals of various hostility levels, please be careful. Explore to discover new life and resources. This planet has #{start_planet.water}% of water."