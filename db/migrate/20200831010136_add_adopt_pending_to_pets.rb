class AddAdoptPendingToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adopt_pending, :boolean, default: false, null: false
  end
end
