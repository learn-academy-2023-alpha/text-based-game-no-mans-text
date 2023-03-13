# text-based-game-no-mans-text

Game name: No Man's Text
Single player

enter your username
Player: health (integer), skills (hash), life support (integer), name (string), equipment (array of strings), known things (array of arrays)
in a player class, these are given initial values. As the players continues the game, these can be updated based on player choices


starting point:
- choice of earth or a stranded planet

You have landed on planet Zureth, the air is thin, a gas circles around the ground, do not remove life support system this doe not look like an oxygen friendly planet! Explore further to learn more or leave to find a safer location.
Encounter species-
Hostility-
Temperature-

Intro paragraph for each planet string interpolated 
Planet Class
- name (string that will start blank), player has the option to name the planet
- Hostility (integer from a random value 0..10)
- Temperature (integer from -40..140 degrees F)
- Color (array of strings)
- Water (integer 0..100 that captures what % of the world has water)
- Minerals (array of strings/objects)
- Animals (array of strings/objects)
- plants (array of strings/objects)
- places (array of strings/objects)
- aliens (array of strings/objects)


Plants Class
- name (string that will start blank), player has the option to name the plant
- size
- color
- plant types
    - water plants (algae, kelp, seaweed)
    - terrestial plants (trees, bushes, grass)
- flowers or no? (true/false)
- edible? (true/false)
- poisonous? (true/false)
- hostility (integer)


Animals Class
- name (string that will start blank), player has the option to name the plant
- size
- color
- legs (integer)
- heads (integer)
- arms (integer)
- types
    - vertibraes 
    - invertibraes
    - phyla (fish, amphibeans, reptiles, mammals, birds)
- diet (herbivore, carnivore, omnivore)
- edible? (true/false)
- poisonous? (true/false)
- hostility (integer)


Places Class
- name (string that will start blank), player has the option to name the place
- natural (lakes, rivers, ocean, mountains, caves, cliffside)
- unnatural (abandoned buildings, city, shipwreck)
- population (integer)
- hostility (integer)


Minerals class
- name (string that will start blank), player has the option to name the mineral
- color
- hardness 
- melting point

Events Class
- Planet events 
    - Get ambushed (randomize) OR
    - Discover new places, animals, plants OR
    - Nothing happens
- Space events
    - Discover new planet OR
    - Encounter other travellers (nothing happens, trade with them, attack them, they attack you) OR
    - Nothing happens


Lava, Ice, Wasteland, Jungle


call to action
- research team needs player to deliver supplies


what we can do on earth: 
- Explore new areas
- Return to previous areas
- Meet people
- Meet new animals
- Meet new plants
- Meet new minerals

explore the world
meets plants, animals, minerals
encounter aliens
travel to different planets
collect rare materials 
find significant artifacts
gameplay of stuff between planets
lose by dying
life support system

tables that has different values and is able to pull different values to create different animals, plants, random encounters, etc.