require './models/worker.rb'
require './models/crawlerWorker.rb'

crawlerWorker = CrawlerWorker.new

while true do

	crawlerWorker.doJob

	sleep 5

end