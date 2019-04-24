class Step < ApplicationRecord
  belongs_to :project

  def set_step( new_description )
    self.step = new_description
  end

  def done?
    return true if step.present?
  end

end
