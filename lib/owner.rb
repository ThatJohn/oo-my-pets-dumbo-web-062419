class Owner
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def species
    @species = "human"
  end

  def say_species
    species = self.species
    "I am a #{species}."
  end

  def cats
    Cat.all.select{|cat| cat.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each{|doggo| doggo.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|demon| demon.mood = "happy"}
  end

  def sell_pet(pet)
    pet.owner = nil
    pet.mood = "nervous"
  end

  def sell_pets

    self.cats.each do |demon|
      demon.mood = "nervous"
      demon.owner = nil
    end

    self.dogs.each do |doggo|
      doggo.mood = "nervous"
      doggo.owner = nil
    end

  end

  def list_pets
    demoncount = self.cats.count
    doggocount = self.dogs.count

    "I have #{doggocount} dog(s), and #{demoncount} cat(s)."
  end

  def self.reset_all
    self.all.clear
  end


end