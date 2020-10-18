require 'pry'
class Owner

  attr_reader :name, :species

  @@all = []
  
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a human."
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
    Cat.all.select { |cat_instance| cat_instance.owner == (self) }
  end

  def dogs
    Dog.all.select { |dog_instance| dog_instance.owner == (self) }
  end

  def buy_cat(name)
    new_cat = Cat.new(name, owner=self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, owner=self)
  end

  def walk_dogs
    Dog.all.select { |dog_instance| 
    if dog_instance.owner == self
      dog_instance.mood=(@mood = "happy")
    else
    end
    }
  end

  def feed_cats 
    Cat.all.select { |cat_instance|
    if cat_instance.owner == self
    cat_instance.mood=(@mood = "happy")
    end
    }
  end

  def sell_pets
    Cat.all.select { |cat_instance|
    if cat_instance.owner == self
    cat_instance.mood=(@mood = "nervous")
    cat_instance.owner = nil
    end
    }

    Dog.all.select { |dog_instance| 
    if dog_instance.owner == self
      dog_instance.mood=(@mood = "nervous")
      dog_instance.owner =  nil
    else
    end
    }
  end

  def list_pets
    number_of_cats = self.cats.length
    number_of_dogs = self.dogs.length
    return "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."

  end

end