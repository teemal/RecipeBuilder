FactoryBot.define do
  factory :ingredient do
    name { 'Ingredient Name' }
    acquired { false }
  end

  factory :complete_ingredient, class: Ingredient do
    name { 'Complete Ingredient' }
    acquired { true }
  end

  factory :incomplete_ingredient, class: Ingredient do
    name { 'Incomplete Ingredient' }
    acquired { false }
  end
end
