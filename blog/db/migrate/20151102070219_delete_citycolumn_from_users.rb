class DeleteCitycolumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :city
  end
end
