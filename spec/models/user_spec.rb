require 'rails_helper'

  describe User do
    before { @user = User.new(username: "Example User", dialect_id: 1) }
    subject { @user }
    it { should respond_to(:username) }
    it { should respond_to(:dialect) }
  end