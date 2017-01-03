require 'nokogiri'
require 'open-uri'

#html = open("http://www.amazon.co.jp/gp/bestsellers/").read.encode("UTF-8", "Shift_JIS")
html = open("http://news.yahoo.co.jp").read.encode("UTF-8", "Shift_JIS")

doc = Nokogiri.HTML(html)

puts doc.xpath('//title').text
