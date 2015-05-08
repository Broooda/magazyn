class Group < ActiveRecord::Base
  has_many :taken_tools
  has_many :users

  validates :name, presence: :true
end
