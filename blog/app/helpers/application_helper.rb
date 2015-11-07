module ApplicationHelper
  def sortable(column, title = nil)
  	if params[:direction]=="nil"
  	params[:direction]="asc"
    end	
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
    
  def searchable(name)
      name= params[:name]
  end

end
