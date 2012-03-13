class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
     t.references :admin
     t.string "name", :null => false
     t.text "content", :null => false
     t.timestamps
    end
  end

  def self.down
   drop_table :posts
  end

end
