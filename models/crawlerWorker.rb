require 'redis'
require 'json'
require 'mechanize'

class CrawlerWorker < Worker

	def doJob
		self.clear
		jobToDo = @redis.lpop("jobsToDo")

		if !jobToDo.nil?
			jobParsed = JSON.parse jobToDo
			self.setJob(jobParsed['task'], jobParsed['url'])

			puts "#{self.task} on #{self.url}"
			displayWebPage(self.url)
			@redis.rpush('jobsDone', self.toJson)

			self.showJobsToDo
			self.showJobsDone
		end
	end

	def displayWebPage(url)
		webPage = Mechanize.new.get(url)
		puts "======================================"
		puts "Title : #{webPage.title}"
		puts "Body : "
		puts webPage.body
		puts "======================================"
	end

	def showJobsToDo
		jobsToDoCount = @redis.llen 'jobsToDo'
		puts "Jobs that need to be done #{jobsToDoCount} :"
		puts @redis.lrange("jobsToDo", 0, -1)
	end

	def showJobsDone
		jobsDoneCount = @redis.llen 'jobsDone'
		puts "Done jobs #{jobsDoneCount} :"
		puts @redis.lrange("jobsDone", 0, -1)
	end

end