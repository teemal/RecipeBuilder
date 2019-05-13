FactoryBot.define do
  factory :step do
    description { "Shake and Bake" }
    completed { false }
    recipe
  end

  factory :complete_step, class: Step do
    description { "Salt" }
    completed { true }
    recipe
  end

  factory :incomplete_step, class: Step do
    description { "Salt" }
    completed { false }
    recipe
  end
end
