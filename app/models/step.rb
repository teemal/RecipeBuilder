class Step
  DEFAULT_DESCRIPTION = "New Step"
  attr_accessor :description

  def initialize(args = {})
    @description = args.fetch( :description, DEFAULT_DESCRIPTION )
  end

  def description
    @description
  end

  def set_description( new_description )
    @description = new_description
  end

  def done?
    return true if description != DEFAULT_DESCRIPTION
  end

end
