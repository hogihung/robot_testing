
describe "A robot double" do
  it "returns canned response from the methods named in the provided hash" do
    tobor = double("A Robot", :name => 'six_of_nine', :model => 'asiv_mark_two')
    expect(tobor.name).to eq('six_of_nine')
    expect(tobor.model).to eq('asiv_mark_two')
  end
end
