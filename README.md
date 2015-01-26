# no_sql_tp01

##Subjet
Thanks to Redis, create queue management system that can :
- Add a job
- Do the job
- Show the number of jobs that it has to do
- Show the number of jobs that have been done

It was decided that the job will send a 'GET' HTTP request on an url.
Then it will show the page title and the page content to the user.
Finally, it will display jobs that will be executed and the jobs that have been already done.

####What do you need ?

* Ruby : dynamic, open source programming language with a focus on simplicity and productivity.
* Redis  : open source, BSD licensed, advanced key-value cache and store

> gem install redis

* JSon : lightweight data-interchange format

> gem install json ( to parse HTML)

* Mechanize : library used for automating interaction with websites

> gem install mechanize

<!> You can launch <!>

> bundle install

####Where do I start ?
1. Launch Redis server :
> redis-server

2. Create jobs (irb) 
> load 'main.rb'

3. Launch daemon (irb) 
> load 'daemon.rb'

####For more information, please see below :
http://slides.com/mathieulaporte-1/nosql#/1