class CreateAdmins < ActiveRecord::Migration
  def self.up
   create_table :admins, :force => true do |t|
    t.string   "username",        :limit => 25                , :null => false
    t.string   "email",                         :default => "", :null => false
    t.string   "hashed_password", :limit => 40
    t.string   "salt",            :limit => 40
    t.timestamps
   end
  end
  
  def self.down
    drop_table :admins
  end

end
