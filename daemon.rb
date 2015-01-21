require 'redis'
require 'json'
require 'mechanize'
require './models/worker.rb'
require './models/daemonWorker.rb'

while true do
	
	daemonWorker = DaemonWorker.new
	daemonWorker.startListening

	sleep 5

end