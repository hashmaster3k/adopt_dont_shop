class Favorite

  attr_reader :contents

  def initialize(contents)
    @contents = contents || Array.new
  end

  def add_pet(pet_id)
    @contents << pet_id
  end

  def total_favs
      return @contents.count if @contents
      retrun 0 if @contents == nil
  end

end
