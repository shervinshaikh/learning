require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://my.sa.ucsb.edu/public/curriculum/coursesearch.aspx"  
doc = Nokogiri::HTML(open(url))  
message = doc.css("#ctl00_pageContent_quarterList").text
message = message.to_s
message = message.split(/\W+/)

even = []
x = 2 
message.each_index{|index|
    even << message[index] if index % x == 0
}
odds = message - even
m = []
odds.each_index{|i|
	m << even[i] + " " + odds[i]
}
m.each do |p|
	puts p
	puts
end