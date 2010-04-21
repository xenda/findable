# Findable
module Findable
  
  def self.included(base)
	
	base.class_eval do
	
	
    named_scope :with_fields, lambda { |fields|  fields = "*" if fields.blank?; {:select=>[fields]}  }
    named_scope :limit, lambda{|limit| {:limit=>limit, :order=>"created_at DESC"}}
    named_scope :random, lambda{|klass| puts self; {:select=>"*, id as r1", :joins=>"(SELECT ROUND(RAND()*( SELECT MAX (id) from #{klass.name} #{klass.class})) as id ) as r2", :conditions=>"r1.id >= r2.id", :order=>"r1.id", :limit => 1}  }
    
  end
  
  end  
          # SELECT <COLUMN> FROM <TABLE> AS r1
          # JOIN (SELECT ROUND(
          #   RAND( ) * (
          #     SELECT MAX( id ) FROM <TABLE>)
          #   ) AS id
          # ) AS r2
          # WHERE r1.id >= r2.id
          # ORDER BY r1.id ASC
          # LIMIT 1;
          
          	
end

ActiveRecord::Base.send :include,Findable


%w{ models controllers helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.load_paths << path
  ActiveSupport::Dependencies.load_once_paths.delete(path)
end