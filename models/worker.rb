class Worker
	def initialize
		@task = "GET"
		@url = "http://slides.com/mathieulaporte-1/nosql#/1"
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
		redis = Redis.new
		redis.rpush("jobsToDo", self.toJson)
		puts "Add : #{@task} associated to #{@url}"
	end
end