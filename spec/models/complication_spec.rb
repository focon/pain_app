require 'spec_helper'

describe Complication do
let(:user) { FactoryGirl.create(:user) }
before { @complication = user.complications.build(content: "Lorem ipsum")}

subject { @complication }
 it { should respond_to(:content) }
 it { should respond_to(:user_id) }
 it { should respond_to(:user) }
 its(:user) { should eq user }

it { should be_valid }

describe "when user_id is not present" do
before { @complication.user_id = nil }
it { should_not be_valid }
end
describe "with blank content" do
before { @complication.content = " " }
it { should_not be_valid }
end
describe "with content that is too long" do
before { @complication.content = "a" * 141 }
it { should_not be_valid }
end
end
