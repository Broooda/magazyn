class AddedTool < ActiveRecord::Base
  belongs_to :tool

  validates :tool_id, :count, presence: :true
end
