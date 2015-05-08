class PanelController < ApplicationController
# before_action :authenticate_admin!

  def index
    @groups = Group.all
    @tools = Tool.where(active: true)
  end

  def history
    @history = TakenTool.all + AddedTool.all
  end
end
