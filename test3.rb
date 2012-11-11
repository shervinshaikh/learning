require 'rubygems'  
require 'mechanize'
require 'open-uri' 
  
agent = Mechanize.new
agent.get("http://my.sa.ucsb.edu/public/curriculum/coursesearch.aspx")
form = agent.page
puts form