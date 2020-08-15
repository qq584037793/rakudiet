FactoryBot.define do
  factory :comment do
    cook_id { 1 }
    user_id { 1 }
    content { "MyText" }
  end
end
