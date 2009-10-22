# Findable
module Findable
	
   def self.included(base)

			base.class_eval do
				
        	named_scope :with_fields, lambda { |fields|  fields = "*" if fields.blank?; {:select=>[fields]}  }

	      end

	    end
	
end

ActiveRecord::Base.send :include, Findable
