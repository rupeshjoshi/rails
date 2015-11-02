class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, :id=>false, :primary_key => :article_id do |t|

        t.integer :article_id
    	t.string :topic
    	t.string :description, :default =>"no discription"
    	t.string :name, :limit => 30 
        t.integer :age, :default=>0



      t.timestamps null: false
    end
  end
end
