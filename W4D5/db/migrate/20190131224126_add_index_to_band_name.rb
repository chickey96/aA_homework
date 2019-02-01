class AddIndexToBandName < ActiveRecord::Migration[5.2]
  def change
    add_index :bands, :name
  end
end
