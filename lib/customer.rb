require 'pry'


class Customer

    @@all = []

    attr_accessor :name, :age

    def initialize(name,age)
        @name=name
        @age=age
        @@all << self
    end
  
    def self.all
        @@all
    end

    def new_meal(waiter,total,tip)
        Meal.new(waiter,self,total,tip)
    end

    def meals
        Meal.all.select {|meal|self == meal.customer}
        #binding.pry
    end

    def waiters
        new_array = []
        Meal.all.each do |meal|
            if self == meal.customer
                new_array << meal.waiter
            end
        end
        new_array
        #Meal.all.select {|meal| meal.waiter if self == meal.customer end}
        #binding.pry
    end


end