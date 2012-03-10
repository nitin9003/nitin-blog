class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.references :post
      t.text "content"		      , :null => false
      t.string "author"		      , :null => false
      t.string "email", :default => "", :null => false
      t.timestamps
    end
  end

  def self.down
   drop_table :posts
  end

end
