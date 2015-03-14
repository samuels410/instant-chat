FactoryGirl.define do  factory :active_user do
    channel_id 1
user_id 1
  end

  factory :user do
    username "Example user"
    dialect_id 1
    guest true
  end
end
