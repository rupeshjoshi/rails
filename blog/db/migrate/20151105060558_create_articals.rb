class CreateArticals < ActiveRecord::Migration
  def change
    create_table :articals do |t|
     
      t.belongs_to :user, index: true
      t.string :topic
      t.string :description
      
      t.timestamps null: false
    end
  end
end
