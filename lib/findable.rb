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


%w{ models controllers helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end