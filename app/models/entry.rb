class Entry < ActiveRecord::Base
  has_many :entries_users, class_name: "EntriesUsers"
  belongs_to :entry_type
  has_many :users, through: :entries_users
end
