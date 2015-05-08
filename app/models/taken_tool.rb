class TakenTool < ActiveRecord::Base
  belongs_to :tool
  belongs_to :group

  validates :tool_id, :count, presence: :true
end
