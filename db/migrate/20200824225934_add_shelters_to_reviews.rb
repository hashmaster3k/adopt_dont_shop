class AddSheltersToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :shelter_id, :integer
  end
end
