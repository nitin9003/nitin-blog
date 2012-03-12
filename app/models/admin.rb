require 'digest/sha1'

class Admin < ActiveRecord::Base
 
  has_many :posts

  attr_accessor :password
  # validations

EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates :username,  :presence => true,
			:length => { :within => 8..25 },
			:uniqueness => true

  validates :email,	:presence => true,
			:length => { :maximum => 100 },
			:uniqueness => true,
			:format => { :with => EMAIL_REGEX },
			:confirmation => true

  # only on create, so other attributes of this user can be changed
 
   validates_length_of :password, :within => 8..25, :on => :create

#  validates_presence_of :username
#  validates_length_of :username, :within => 8..25
#  validates_uniqueness_of :username
#  validates_presence_of :email
#  validates_length_of :email, :maximum => 100
#  validates_format_of :email, :with => EMAIL_REGEX
#  validates_confirmation_of :email

  before_save :create_hashed_password
  after_save :clear_password

  attr_protected :hashed_password, :salt

  def self.authenticate(username="", password="")
    a = Admin.find_by_username(username)
    if a && a.password_match?(password)
       return a
    else
       return false
    end
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashes_password.
  
  def password_match?(password="")
    hashed_password == Admin.hash_with_salt(password, salt)
  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private

  def create_hashed_password
    # Whenever :password has a value hashing is needed
     unless password.blank?
        #always use "self" when assigning values
        self.salt = Admin.make_salt(username) if salt.blank?
        self.hashed_password = Admin.hash_with_salt(password, salt)
     end
  end

  def clear_password
     # for security and b/c hashing is not needed
     self.password = nil
  end

end
