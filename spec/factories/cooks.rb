FactoryBot.define do
  factory :cook do
    name { Faker::Food.dish }
    description { "冬に食べたくなる、身体が温まる料理です" }
    portion { 1.5 }
    tips { "ピリッと辛めに味付けするのがオススメ" }
    reference { "https://cookpad.com/recipe/2798655" }
    required_time { 30 }
    popularity { 5 }
    association :users
  end
end
