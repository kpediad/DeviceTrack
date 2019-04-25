class User < ActiveRecord::Base
  has_secure_password
  has_many :devices
  has_many :types

  def self.exists?(username)
    User.find_by(username: username)
  end
end
