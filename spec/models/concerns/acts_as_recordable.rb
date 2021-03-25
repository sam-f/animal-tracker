shared_examples_for "a recorder of activities" do
  it { should validate_presence_of :recorded_on }
end
