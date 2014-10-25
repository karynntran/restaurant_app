module Sinatra
	module LinkHelper

		def link_to_all(resource)
	      return "<a class = 'nav' href='/#{resource}'>See all #{resource}?</a>" if url.is_a? String
	      link_to(resource)

	    end

	    def record_path(record)
	      party_name = record.class.party_name
	      record_id  = record.id
	      "/#{party_name}/#{record_id}"
	    end

	    def resource_index_path(resource)
      		"/#{pluralize(resource)}"
    	end
    end
	helpers LinkHelper
end

