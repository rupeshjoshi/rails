class RenameAddresscolumnToCityUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :address, :city 
  end
end
