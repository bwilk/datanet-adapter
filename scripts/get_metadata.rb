require 'uri'
require 'net/http'
require 'json'

collection_url = ARGV[0] || "http://process.cyfronet.pl:8080/datanet/metadata-col-1"

url = URI(collection_url)

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Basic #{ENV['AUTH']}"
request["cache-control"] = 'no-cache'

response = http.request(request)
puts response.code

if response.code == "200"

  parsed = JSON.parse(response.read_body)
  col = parsed['_embedded']
  col.each do |ent|
  	puts ent['_id']['$oid']
  end

end
