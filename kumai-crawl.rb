# -*- coding: utf-8 -*-
require 'anemone'
require 'io/console'

puts "URLを入力してください"

urlname = gets
urlname.chomp!

#クロールの起点となるURLを指定
urls = []
urls.push(urlname);

Anemone.crawl(
  urls,:depth_limit => 1, :skip_query_strings => true) do |anemone|

  #巡回先の回り込み
  anemone.focus_crawl do |page|
    page.links.keep_if { |link|
      link.to_s.match(/product/)
    }
  end

  #取得したページに対する処理
  anemone.on_every_page do |page|
    puts page.url
  end
end
