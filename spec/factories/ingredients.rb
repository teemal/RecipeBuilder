FactoryBot.define do
  factory :ingredient do
    name { '' }
    acquired { false }
    recipe
  end

  factory :complete_ingredient, class: Ingredient do
    name { 'Complete Ingredient' }
    acquired { true }
    recipe
  end

  factory :incomplete_ingredient, class: Ingredient do
    name { 'Incomplete Ingredient' }
    acquired { false }
    recipe
  end
end
