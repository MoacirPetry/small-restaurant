module OrderHelper
  def completed(value)
  	response = ""

  	if value == true
  	  response = "Completed"
  	elsif value == false
  	  response = "Open"
  	end

  	response
  end
end
