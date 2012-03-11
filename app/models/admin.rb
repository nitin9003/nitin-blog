class Admin < ActiveRecord::Base
 
  has_many :posts

#validations

EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :username,  :presence => true,
			:length => { :within => 8..25 },
			:uniqueness => true

  validates :email,	:presence => true,
			:length => { :maximum => 100 },
			:uniqueness => true,
			:format => { :with => EMAIL_REGEX },
			:confirmation => true

#  validates_presence_of :username
#  validates_length_of :username, :within => 8..25
#  validates_uniqueness_of :username
#  validates_presence_of :email
#  validates_length_of :email, :maximum => 100
#  validates_format_of :email, :with => EMAIL_REGEX
#  validates_confirmation_of :email

end
