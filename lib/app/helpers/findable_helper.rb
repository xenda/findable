module FindableHelper

  def ul_tag(collection,li_options = {},ul_options={})
    
    list_items = collection.map{|item|
      result = yield(item)
      content_tag(:li,result,li_options)
    }.join
    
    content_tag(:ul,list_items,ul_options)
    
  end
  
  
end