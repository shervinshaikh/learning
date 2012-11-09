require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
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
	puts
end
#puts message
#doc.css(".item").each do |item|  
#  puts item.at_css(".prodLink").text  
#end 
