module TablesHelper
  def availability(value)
  	response = ""

  	if value == true
  	  response = "Busy"
  	elsif value == false
  	  response = "Free"
  	end

  	response
  end
end
