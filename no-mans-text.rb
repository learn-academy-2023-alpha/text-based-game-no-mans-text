class Player
    attr_accessor :health, :life_support, :skills, :equipment, :known_things
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
        @minerals = Array.new(rand(10))
        @plants = Array.new(rand(10))
        @places = Array.new(rand(10))
        @aliens = Array.new(rand(10))
        @animals = Array.new(rand(10))
    end
end

class plants
    def initialize()
        @name = nil
        @size = ['tiny', 'small', 'medium', 'large', 'huge'].sample
        @color = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'black', 'white', 'brown'].sample
        @type = ['algae', 'kelp', 'seaweed', 'tree', 'bush', 'grass'].sample
        @flower = [true, false].sample
    end
end
