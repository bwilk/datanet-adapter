require 'date'

class Processing 

	attr_accessor :metadata

	def perform
		timestamp = DateTime.now.strftime('%Q')
		data_count = Dir.entries("/data").count
		@metadata = {"desc"=>"testing", "timestamp"=>timestamp, "data_count"=> data_count}
	end

end