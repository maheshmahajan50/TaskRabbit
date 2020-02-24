module TasksHelper
  def options_for_categories
    options_for_select Category.all.map{ |cat| [cat.name, cat.id] }
  end  
end
