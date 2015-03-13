require 'rails_helper'

describe Message do

  let(:user) { FactoryGirl.create(:user) }


  before { @message = user.messages.build(content: "Lorem ipsum") }

  subject { @message }

  it { should respond_to(:content) }

  it { should respond_to(:translated_message) }

  it { should respond_to(:user_id) }

  it { should respond_to(:user) }


  it { should be_valid }


  describe "when user_id is not present" do
    before { @message.user_id = nil }

    it { should_not be_valid }
  end
end