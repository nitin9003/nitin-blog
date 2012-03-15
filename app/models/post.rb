class Post < ActiveRecord::Base

 belongs_to :admin
 has_many :comments

 validates_presence_of :name
 

end
