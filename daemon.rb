require 'redis'
require 'json'
require 'mechanize'
require './models/worker.rb'
require './models/crawlerWorker.rb'

while true do
	
	crawlerWorker = CrawlerWorker.new
	crawlerWorker.startListening

	sleep 5

end