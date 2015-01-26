require './models/worker.rb'

urls = ["https://www.google.fr/?gws_rd=ssl", "http://ecampusbordeaux.epsi.fr/contact-info", "http://lesjoiesducode.fr/"]
iUrl = 0

worker = Worker.new

while true do

	worker.setJob("GET", urls[iUrl])
	worker.saveJob()

	iUrl = (iUrl+1).modulo(urls.length)

	sleep 5
	
end