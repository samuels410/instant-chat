FactoryGirl.define do
  factory :user do
    username "Example user"
    dialect_id 1
    guest true
  end
end
