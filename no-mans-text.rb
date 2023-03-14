# Create a class to manage a player object
# Current implementation tracks a player's state and provides global access to their attributes
# Expansion ideas:
      # Create methods for interaction
      # Create methods for actions available to the player
      # Allow the player to track named objects
      # Allow the player to collect items through exploration and combat
      # Allow the player to develop and use various skills
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

# Create a class for procedurally generating a new planet
# A planet is defined through the basic characteristics and has arrays of different classes that can exist on that planet
# Expansion ideas:
      # Provide interaction between a planet's different elements
            # eg hostile planets have more hostile vegitation and animals
            # eg temperature and water impact types of plants and animals
      # Create some sort of map for each planet
      # Tune the weights for number of different objects of each class created for any planet
      # Add variable for gravity with different interactions
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
            @animals = Array.new(rand(10)) { Animal.new }
            @places = Array.new(rand(10)) { Place.new }
      #   @aliens = Array.new(rand(10)).each {|value| value = Mineral.new()} # Pending development
      end
end

# Create a class for procedurally generating a plant species
# Expansion ideas:
      # Provide a means of distinguishing a plant species from a specific plant
      # Provide interaction between the plants and their environment/planet
            # eg Waterworlds bias instantiation of algea, kelp, and seaweed
            # eg Growth rate, with interaction from predators
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

# Create a class for procedurally generating an animal species
# Expansion ideas:
      # Specify food and bias creation of animals near their preferred food
      # Provide a means of distiguishing animal species from a specific animal
      # Create procreation methods and rates
      # Tune generation of arms/legs/heads to bias towards realistic/interesting options
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

# Expansion idea: Create a class for alien species

# Create a class for procedurally generating a location
# Expansion ideas:
      # Tune the population attribute to weigh different categories
      # Specify the types of plants and animals found in different locations
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

# Create a function to manage exploration of a planet
# The function takes as an argument the planet being explored
# The user sees a prompt and is able to input a choice for direction of travel
# The user's selection is discarded, and random encounters are provided based upon a table
# For each encounter, a random object of the designated class is presented
# The user is able to name new discoveries
# If the total hostility of the planet and the plant/animal exceeds 10, then combat is initiated
# Expansion ideas:
      # Allow the player to collect samples from different encounters
      # Provide social interaction for population centers
      # Provide unique interaction based upon inventory items

def explore_planet (planet)
      puts 'Please enter a direction (N, E, S, W)'
      direction = gets.chomp.upcase
      random_encounter = rand(100)
      case random_encounter
      when 0..15 # Nothing happens
            puts 'No events have occured at this time'
      when 16..25 # Animal encounter
            index = rand (planet.animals.length - 1)
            encounter_animal = planet.animals[index]
            if encounter_animal.name.nil?
                  puts "You have encountered a new animal species! This is one for the history books now closely but carefully note these characteristics about the animal. It is #{encounter_animal.size} size, With a #{encounter_animal.color} color, This animal has #{encounter_animal.legs} legs, they have #{encounter_animal.heads} head/heads.they have #{encounter_animal.arms} arms. It appears to be a species of #{encounter_animal.type}, It has a diet of #{encounter_animal.diet}." 
                  puts 'what would you like to name your new discovery'
                  encounter_animal.name = gets.chomp
                  planet.animals[index].name = encounter_animal.name
            else
                  puts "You have encountered an animal! You recognize from it's  #{encounter_animal.size} size, #{encounter_animal.color} color, #{encounter_animal.legs} leg, #{encounter_animal.heads} head/heads, and #{encounter_animal.arms} arms. It appears to be a #{encounter_animal.name}."
            end

            if 4 < planet.hostility + encounter_animal.hostility
                  combat_encounter (encounter_animal)
            end
      when 26..60 # Plant encounter
            index = rand (planet.plants.length - 1)
            encounter_plant = planet.plants[index]
            plant_flower = encounter_plant.flower ? 'has flowers': 'does not have flowers'
            if encounter_plant.name.nil?
                  puts "You have found a unique plant species unlike any on earth! carefully note these characteristics about the plant. It is #{encounter_plant.size} size, With a #{encounter_plant.color} color, This plant #{plant_flower}, It appears to be a species of #{encounter_plant.type}." 
                  puts 'what would you like to name your new discovery'
                  encounter_plant.name = gets.chomp
                  planet.plants[index].name = encounter_plant.name
            else
                  puts "You have found a familiar plant! based on these characteristics about the plant. You recognize it to be a #{encounter_plant.name}! It is #{encounter_plant.size} with a #{encounter_plant.color} color, This plant #{encounter_plant.flower ? 'has flowers': 'does not have flowers'}, It appears to be a species of #{encounter_plant.type}." 
            end   

            if 4 < planet.hostility + encounter_plant.hostility
                  combat_encounter (encounter_plant)
            end
      
      when 61..90 # Mineral encounter
            index = rand (planet.minerals.length - 1)
            encounter_mineral = planet.minerals[index]
            if encounter_mineral.name.nil?
                  puts "You have found a #{encounter_mineral.color} color mineral that is common to this planet, but it has no name, Please enter a name for it now. it has a #{encounter_mineral.type}, there is also a #{encounter_mineral.hardness} hardness about this mineral. It can be melted at #{encounter_mineral.melting_point} degrees Fahrenheit."
                  puts 'what would you like to name your new discovery'
                  encounter_mineral.name = gets.chomp
                  planet.minerals[index].name = encounter_mineral.name
            else
                  puts "You have found some #{encounter_mineral.name}! It is a #{encounter_mineral.color} #{encounter_mineral.type}, there is also a #{encounter_mineral.hardness} hardness about this mineral. It can be melted at #{encounter_mineral.melting_point} degrees Fahrenheit."
            end   
      when 91..100 # Place encounter
            index = rand (planet.places.length - 1)
            encounter_place = planet.places[index]
            if encounter_place.name.nil?
                  puts "You have encountered a new #{encounter_place.size} #{encounter_place.type}, this is a beautiful site! It has a population of #{encounter_place.population}." 
                  puts 'what would you like to name your new discovery'
                  encounter_place.name = gets.chomp
                  planet.places[index].name = encounter_place.name
            else
                  puts "You have returned to #{encounter_place.name}! It is a  #{encounter_place.size} #{encounter_place.type}, with a population of #{encounter_place.population}."
            end   
    else
      puts 'Error'
    end
end 

# Create a function to manage combat encounters
# Function will receive an argument for the opponent, receiving the species
# A default 2 HP is provided to the opponent
# During combat, the player will be able to continue fighting, attempt to flee, or surrender
# Expansion ideas:
      # Provide opponent with HP based upon the species encountered
      # Provide poisonous opponents with the ability to use their deadly skills
      # Provide unique damage areas and types based upon the creature
      # Allow dismemberment/smashing/unique damage to destroy body parts
      # After victory, allow the player to collect samples from the defeated opponent
      # Provide inventory interaction options

def combat_encounter (opponent)
      # Initialize the fight
      opponent_health = 2
      fighting = 'yes'
      puts "The #{opponent.name} is menacing! It begins to attack you!"

      loop do
            # Provide player with options for combat
            # Expansion ideas:
                  # 
            puts 'Would you like to fight, flee, or surrender?'
            player_move = gets.downcase.chomp

            case player_move
            when 'fight'
                  puts 'You strike with your bare hands at your opponent!'
                  if 3 < rand(10)
                        puts "You successfully hit the #{['arm', 'leg', 'body', 'head'].sample} of the #{opponent.name}!"
                        opponent_health -= 1
                        if 0 >= opponent_health
                              puts "You have defeated the #{opponent.name}!"
                              fighting = 'no'
                        end
                  else
                        puts "The #{opponent.name} #{['strikes', 'bashes', 'slashes', 'stomps', 'bites'].sample} your #{['arm', 'leg', 'body', 'head'].sample}."
                        $new_player.health -= 1
                  end
            when 'flee'
                  puts 'You attempt to flee!'
                  if 3 < rand(10)
                        puts 'You successfully escape!'
                        fighting = 'no'
                  else
                        puts 'You failed to escape!'
                  end
            when 'surrender'
                  puts "You surrender, and the #{opponent.name} enslaves you!"
                  fighting = 'no'
            else
                  puts "You failed to pick an effective choice, and take damage as the #{opponent.name} strikes you!"
                  player_health -= 1
            end

            if 0 >= $new_player.health 
                  puts 'You have died!'
                  fighting = 'no'
            end

            break if 'no' == fighting
      end
end

# Initialize a new game
# Expansion idea: provide a way to influence seed for random number generators
puts 'Please enter a user name.'

# Player is created as a global object to provide access within various functions
# Expansion idea: pass the player object as an argument to various functions
$new_player = Player.new(gets.chomp)

# Start planet is created and passed to various functions for reference
start_planet = Planet.new()

puts "Welcome, #{$new_player.name}. You have landed onto a new and beautiful planet. The planet has a #{start_planet.color} color. The temperature is #{start_planet.temperature} degrees Fahrenheit. There are many animals of various hostility levels, please be careful. Explore to discover new life and resources. This planet has #{start_planet.water}% of water."

# Do..while loop to process gameplay
# Expansion ideas:
      # Provide an option to build
      # Provide an option to travel to known locations on this planet
      # Provide an option to explore space
      # Provide an option to travel to a known planet
      # Provide a way to view known planets/places/aliens/animals/plants
      # Provide a way to save and load
loop do 
      explore_planet start_planet

      puts 'Would you like to continue exploring? (y/n)'
      exploring = gets.downcase.chomp
      break if 'n' == exploring 
end