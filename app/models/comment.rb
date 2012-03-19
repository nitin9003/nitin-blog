class Comment < ActiveRecord::Base

 belongs_to :post

  scope :find_post_comments, lambda{ |post_id|  }

end
