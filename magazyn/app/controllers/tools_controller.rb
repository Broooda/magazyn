class ToolsController < ApplicationController
# before_action :authenticate_admin!

  def index
    @tools = Tool.where(active: true).order('created_at DESC')
    @tool = Tool.new
    @add = AddedTool.new
    @take = TakenTool.new
  end

  def edit
    @tool=Tool.find(params[:id])
  end

  def update
    @tool =Tool.find(params[:id])  
    @tool.name = params[:tool][:name]
    @tool.code = params[:tool][:code]
    @tool.count = params[:tool][:count]
    @tool.price = params[:tool][:price]
    if @tool.save
      redirect_to tools_path, notice: "Edytowano "+@tool.name+' '+@tool.code
    else
      redirect_to tools_path, notice: "Blad w edycji"+@tool.name+' '+@tool.code
    end
  end
  
  def new
    @tool=Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      AddedTool.create(tool_id: @tool.id, count: @tool.count)
      redirect_to tools_path, notice: "Utworzono "+@tool.name+' '+@tool.code
    else
      redirect_to tools_path, notice: "Blad w tworzeniu"+@tool.name+' '+@tool.code
    end
  end

  def destroy
    Tool.find(params[:id]).update(active: false)
    @tool = Tool.find(params[:id])
    if @tool.active
      redirect_to tools_path, notice: "Nie usunieto "+@tool.name+' '+@tool.code
    else
      redirect_to tools_path, notice: "Usunieto "+@tool.name+' '+@tool.code
    end
  end

  def change_tools_admin
    if params[:desc] == '+'
      AddedTool.create(tool_id: params[:tool_id], count: params[:count])
      c = Tool.find(params[:tool_id])
      Tool.find(params[:tool_id]).update(count: c.count + params[:count].to_i)
      redirect_to tools_path, notice: 'Zmieniono '+c.name+' '+c.code+' o +'+params[:count]
    else
      TakenTool.create(tool_id: params[:tool_id], count: params[:count])
      c = Tool.find(params[:tool_id])
      if c.count - params[:count].to_i > -1
        Tool.find(params[:tool_id]).update(count: c.count - params[:count].to_i)
        redirect_to tools_path, notice: 'Zmieniono '+c.name+' '+c.code+' o -'+params[:count]
      else
        redirect_to tools_path, notice: 'Nie ma tylu sztuk '+c.name+' '+c.code
      end
    end
  end

  def taken_tools
    if Tool.find(params[:tool_id]).can_take(params[:count].to_i)
      TakenTool.create(group_id: params[:group_id], tool_id: params[:tool_id], count: params[:count])
      c = Tool.find(params[:tool_id])
      Tool.find(params[:tool_id]).update(count: c.count - params[:count].to_i)
      redirect_to root_path, notice: 'Wydano '+params[:count]+' sztuk '+c.name+' '+c.code+' grupie '+Group.find(params[:group_id]).name
    else
      redirect_to root_path, notice: 'Nie ma tylu sztuk w magaynie'
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :count, :code, :price)
  end
end
