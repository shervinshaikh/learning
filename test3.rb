require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://my.sa.ucsb.edu/public/curriculum/coursesearch.aspx"  
doc = Nokogiri::HTML(open(url))  
message = doc.css("#CourseTitle")

puts message