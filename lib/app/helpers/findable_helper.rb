module FindableHelper

  def ul_tag(collection,li_options = {},ul_options={},not_found="No se encontraron")
    
    if collection.nil? or collection.empty?
        list_items = content_tag(:li,not_found)
    else
      list_items = collection.map{|item|
        result = yield(item)
        content_tag(:li,result,li_options)
      }.join
    end
    
    content_tag(:ul,list_items,ul_options)
    
  end
  
  
end