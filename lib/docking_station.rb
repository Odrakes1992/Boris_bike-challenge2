require_relative 'bike'

class DockingStation

  attr_reader :bikes
  # above line is same as:
  # def bike
  #   @bike
  # end

  def initialize 
    @bikes = []
  end


  def release_bike
    fail "No bikes available" if @bikes.empty?
    @bikes.pop
  end

  def dock_bike(object)
    fail "Docking Station is full" if @bikes.count >= 20 
    @bikes << object
  end

end 
