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

  def remove_select_pet(pet_id)
    @contents.delete(pet_id.to_s)
  end

  def remove_selected_pets(array_pet_ids)
    array_pet_ids.each do |pet|
      @contents.delete(pet)
    end
  end

end
