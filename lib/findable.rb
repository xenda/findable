# Findable
module Findable
	
   def self.included(base)
      
      #parent_table = base.table_name.gsub!("_details","")

			base.class_eval do
				
        	named_scope :with_fields, lambda { |fields|  fields = "*" if fields.blank?; {:select=>[fields]}  }
          named_scope :last, lambda{|limit| {:limit=>limit, :order=>"created_at DESC"}}
	    end

	  end
	
end

ActiveRecord::Base.send :include, Findable
