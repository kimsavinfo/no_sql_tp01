require 'redis'
require 'json'

class Worker
	def initialize
		self.clear
		@redis = Redis.new(:host => 'localhost', :port => 6379)
	end

	def clear
		@task = ""
		@url = ""
	end

	def setJob(task, url)
		@task = task
		@url = url
	end

	def task
		@task
	end

	def url
		@url
	end

	def toJson
		{task: @task, url: @url}.to_json
	end

	def saveJob
		@redis.rpush("jobsToDo", self.toJson)
		puts "Add : #{@task} associated to #{@url}"
	end
end