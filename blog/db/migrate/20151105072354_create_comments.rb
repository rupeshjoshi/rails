class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :artical
      t.belongs_to :user
      t.text :comment  
     
      t.timestamps null: false
    end
  end
end
