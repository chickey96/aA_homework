class AddBandOwnerToBand < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :band_owner_id, :integer, null: false 
  end
end
