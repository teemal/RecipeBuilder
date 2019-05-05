RSpec::Matchers.define :have_num_steps do |expected|
  match do |actual|
    size_to_check = actual.step_count
    size_to_check == expected
  end

  description do 
    "have number of steps totaling #{expected}"
  end

  failure_message do |actual|
    "expected recipe {actual.name} to have step size #{expected}, but was #{actual}"
  end

end
