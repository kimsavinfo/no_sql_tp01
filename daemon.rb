require './models/worker.rb'
require './models/crawlerWorker.rb'

crawlerWorker = CrawlerWorker.new

while true do

	crawlerWorker.startListening

	sleep 5

end