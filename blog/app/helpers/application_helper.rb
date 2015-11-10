module ApplicationHelper
  def sortable(column, title = nil)
  	
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
     
  end  

  def sortablegender(column, title = nil)
  	
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
     
  end 
  
  def sortablecity(column, title = nil, name= params[:name])
  	
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction, :name => name
     
  end 

  def searchable(name)
      name= params[:name]
  end

end
