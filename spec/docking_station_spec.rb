require "docking_station"
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike).with(1).argument }
  it { is_expected.to respond_to(:bikes)}
  let (:capacity) {subject.def_capacity}
  
  describe "#release_bike" do
    it "#release a bike" do 
      bike = Bike.new
      subject.dock_bike(bike)
      expect(bike).to be_working # "checks that bike is working" 
      expect(subject.release_bike).to eq bike 
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
        subject.dock_bike Bike.new
      end
      expect {subject.dock_bike Bike.new}.to raise_error("Docking Station is full")
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