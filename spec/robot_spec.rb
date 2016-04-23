require './robot'

describe "A robot double" do
  it "returns canned response from the methods named in the provided hash" do
    tobor = double("A Robot", :name => 'six_of_nine', :model => 'asiv_mark_two')
    expect(tobor.name).to eq('six_of_nine')
    expect(tobor.model).to eq('asiv_mark_two')
  end
end

describe "Creating an instance of a robot" do
  it "returns an insance of a Robot" do
    tobor = Robot.new('Twiki', 'ambuquad')
    expect(tobor).to be_a Robot
  end
end

describe "Creating a robot with name and model" do
  it "returns a valid robot with name and model" do
    tobor = Robot.new('Twiki', 'ambuquad')
    expect(tobor.name).to eq('Twiki')
    expect(tobor.model).to eq('ambuquad')
  end
end

