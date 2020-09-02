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

  def includes_id?(id)
    @contents.include?(id.to_s)
  end

  def has_contents?
    !@contents.empty?
  end

  def count_contents
    @contents.count
  end

  def clear_contents
    @contents.clear
  end

end
