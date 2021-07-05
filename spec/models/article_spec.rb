require 'rails_helper'

RSpec.describe Article, type: model do

  subject { described_class.new }

  it "is valid with valid attributes" do
    suject.title = 'Whatever'
    subject.source = ''
    expect(subject).to be_valid
  end

end