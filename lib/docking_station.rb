require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20 

  attr_reader :bikes
 
  # above line is same as:
  # def bike
  #   @bike
  # end

  def initialize(def_capacity=DEFAULT_CAPACITY)
    @bikes = []
    @def_capacity = def_capacity
  end

  def def_capacity
    @def_capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop

  end

  def dock_bike(object)
    fail "Docking Station is full" if full?
    @bikes << object
  end

  private

  def full?
    @bikes.count >= @def_capacity
  end

  def empty?
    @bikes.empty?
  end

end 

=begin 
  
 # if dockingstation_full = true 
    #  fail "Docking Station is full" 
    # elsif dockingstation_full = false 
    #   @bikes << object
    # end


 #   if full = true 
  #     fail "No bikes available"
  #   else 
  #     bike_available = false
  #     @bikes.pop
  #   end
  


def dockingstation_full
    if @bikes.count >= 20 
      true
    else 
      false
    end
  end
  
  def bike_available
    if @bikes.empty?
      true
    else
      false
    end
  end
=end



