

class Waiter

    @@all = []

    attr_accessor :name, :exp

    def initialize(name,exp)
        @name=name
        @exp=exp
        @@all << self
    end
  
    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select {|meal|self ==meal.waiter}
    end

    def best_tipper
        biggest_tip = 0
        Meal.all.each do |meal|
            if meal.tip > biggest_tip
                biggest_tip = meal.tip
                #binding.pry
            end
        end
        #binding.pry
        Meal.all.each do |meal|
            if biggest_tip == meal.tip
                return meal.customer
            end
        end
    end



end