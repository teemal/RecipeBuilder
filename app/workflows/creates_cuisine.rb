class CreatesCuisine
    attr_accessor :cuisine, :name, :acquired
  
    def initialize(name: "", acquired: false)
      @name = name
      @acquired = acquired
    end
  
    def build
      self.cuisine = Cuisine.new(
        name: name,
        acquired: acquired
      )
      cuisine
    end
  
    def build_with_acquired_default
      self.cuisine = Cuisine .new(
        name: name
      )
      cuisine
    end
  
    def success?
      @success
    end
  
    def create
      build
      result = cuisine.save
      @success = result
    end
  end
  