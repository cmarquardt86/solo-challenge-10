class Etsy::Response
	def result
	  if success?
	    results = to_hash['results'] || []
	    count == 1 ? results.first : results
	  else
	   validate!
	  end
	end
end