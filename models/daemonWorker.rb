class DaemonWorker < Worker
	def startListening
		$r = Redis.new
		currentJob = $r.lpop("jobsToDo")

		if !currentJob.nil?
			jobParsed = JSON.parse currentJob
			job = Worker.new
			job.setJob(jobParsed['task'], jobParsed['url'])

			puts "#{job.task} on #{job.url}"
			displayWebPage(job.url)
			$r.rpush('jobsDone', job.toJson)

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
		jobsToDoCount = $r.llen 'jobsToDo'
		puts "Jobs that need to be done #{jobsToDoCount} :"
		puts $r.lrange("jobsToDo", 0, -1)
	end

	def showJobsDone
		jobsDoneCount = $r.llen 'jobsDone'
		puts "Done jobs #{jobsDoneCount} :"
		puts $r.lrange("jobsDone", 0, -1)
	end
end