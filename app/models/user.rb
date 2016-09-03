require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :entries, class_name: "Entry"

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
