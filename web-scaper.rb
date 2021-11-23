require 'csv'
require 'nokogiri'
require 'open-uri'
html = open("https://en.wikipedia.org/wiki/Douglas_Adams")
doc = Nokogiri::HTML(html)

data_arr = []
description = doc.css("p").text.split("\n").find{|e| e.length > 0}
picture = doc.css("td a img").find{|picture| picture.attributes["alt"].value.include?("Douglas adams portrait cropped.jpg")}.attributes["src"].value

data_arr.push([description, picture])

CSV.open('data.csv', "w") do |csv|
  csv << data
end