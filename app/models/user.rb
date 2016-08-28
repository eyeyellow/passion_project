class User < ActiveRecord::Base
  has_many :entries_users, class_name: "EntriesUsers"
  has_many :entries, through: :entries_users, class_name: "Entry"

  # def password
  #   @password ||= BCrypt::Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = BCrypt::Password.create(new_password)
  #   self.password_hash = @password
  # end
end