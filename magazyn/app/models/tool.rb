class Tool < ActiveRecord::Base
  has_many :taken_tools

  validates :name, :price, :count, :code, presence: :true

  def can_take(how_many)
    return self.count-how_many > -1
  end
end
