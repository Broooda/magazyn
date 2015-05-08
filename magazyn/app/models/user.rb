class User < ActiveRecord::Base
  belongs_to :group

  validates :name, :surname, presence: :true

  def add_to_group(gid)
      self.group_id = gid
  end
end
