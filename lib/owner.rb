require "pry"
class Owner
  # code goes here

  attr_accessor :pets, :cat, :dog
  attr_reader :name, :species

   @@all = []
  

  def initialize(name)
    @name = name 
    @species = "human"
    @pets = {:cats => [], :dogs => []}
    @@all << self
  end 


  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all 
  end 

 def self.count
    @@all.length
 end

 def self.reset_all
  @@all.clear
 end 

 def cats
  Cat.all.select do |cat|
    cat.owner == self 
  end
end 

def dogs
  Dog.all.select do |dog|
    dog.owner == self 
  end
end 


 def buy_cat(cat)
  Cat.new(cat, self)
 end 

 def buy_dog(dog)
  Dog.new(dog, self)
 end 

 def feed_cats
 #binding pry
  self.cats.each {|cat| cat.mood = "happy"}
 
end

 def walk_dogs
 self.dogs.each {|dog| dog.mood = "happy"}
 end

 def sell_pets
    pets = self.cats + self.dogs
    pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
    end
 end 

 def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)." 
 end 

end