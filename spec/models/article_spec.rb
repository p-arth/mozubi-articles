require './spec/rails_helper.rb'

RSpec.describe Article, type: :model do

  subject { described_class.new }

  it "is valid with valid attributes" do
    subject.title = 'Whatever'
    subject.source = 'https://www.google.com/'
    subject.body = nil
    subject.estimated_time = nil
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    subject.source = 'https://www.google.com/'
    subject.body = nil
    subject.estimated_time = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a source" do
    subject.title = 'Whatever'
    subject.source = nil
    subject.body = nil
    subject.estimated_time = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without source being an URL" do
    subject.title = 'Whatever'
    subject.source = 'whatever'
    subject.body = nil
    subject.estimated_time = nil
    expect(subject).to_not be_valid
  end

end