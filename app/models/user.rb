class User < ActiveRecord::Base
  has_many :entries_users, class_name: "EntriesUsers"
  has_many :entries, through: :entries_users, class_name: "Entry"
end
