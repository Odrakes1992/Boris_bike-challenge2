require "docking_station"
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bikes)}
  let (:capacity) {subject.def_capacity}
  let (:bike) { double :bike }
  
  describe "#release_bike" do
    it "#releases a working bike" do 
      #bike = Bike.new
      allow(bike).to receive(:working?).and_return(true) 
      # here we are telling the bike how to behave, 
      # to respond to working and return true
      subject.dock_bike(bike) #as you can see bike above has been defined with let
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end
  end

  describe '#release_bike' do
    it "raise an error if no bikes available" do
    expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe '#dock_bike' do
    it 'raises an error when full' do
      #bike = Bike.new
      #20.times { subject.dock_bike Bike.new }
      capacity.times do
      subject.dock_bike(bike) #Bike.new
      end
        expect {subject.dock_bike(bike)}.to raise_error("Docking Station is full")
    end
  end

  describe "#dock_broken_bike" do
    it "docks broken bike" do 
    #bike = Bike.new
    subject.dock_broken_bike(bike)
    expect(subject.broken_bikes).to include(bike)
    end
  end


end






 
# expect(bike).to eq(:bike)
    #expect(:release_bike).to eq(Bike.new)


 # expect(obj).to respond_to(:foo).with(1).argument
  # method = .dock_bike(@station)

   # it "dock a bike" do
    # @bike = Bike.new
  # end
  

  # it "docks bike" do 
  #   bike = Bike.new
  #   expect(subject.dock_bike(bike)).to eq bike 
  # end

  # subject.dock_bike == DockingStation.dock_bike 