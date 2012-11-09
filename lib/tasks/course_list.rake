desc "Fetch list of courses"  
task :fetch_courses => :environment do  
  require 'nokogiri'  
  require 'open-uri'    
  #Course.find_all_by_subject(nil).each do |course|  
    url = "http://my.sa.ucsb.edu/public/curriculum/coursesearch.aspx"  
    doc = Nokogiri::HTML(open(url))  
    message = doc.css("#ctl00_pageContent_courseList")
	message = message.to_s
	message = message.split(/"([^\"]*)"/)
	even = []
	x = 2 
	message.each_index{|index|
	    even << message[index] if index % x == 0
	}
	odds = message - even
	odds.shift(3)
	odds.each do |p|
		puts p
		Course.create(subject: p)
	end
	#Course.find_all_by_subject(nil).each do |course|
   # 	course.update_attribute(:subject, odds)  
  #end  
end