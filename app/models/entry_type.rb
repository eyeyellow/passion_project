class EntryType < ActiveRecord::Base
  has_many :entries, class_name: "Entry"
end
