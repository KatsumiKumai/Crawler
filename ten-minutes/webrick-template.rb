#!/usr/local/bin ruby
require 'webrick'

class TestContentServlet <
  #サブクラスを作成
  WEBrick::HTTPServlet::AbstractServlet

  #GETリクエストが来たら
  def do_GET(req, res)
    #ページ内容
    res.body = "This is #{req.path}<br>"
    #content_typeを設定
    res.content_type = WEBrick::HTTPUtils.mime_type(
      req.path_info,
      WEBrick::HTTPUtils::DefaultMimeTypes)
  end
end

srv = WEBrick::HTTPServer.new(
  :BindAddress => '127.0.0.1', :Port => 7777)
#Servletの割当先
srv.mount('/', TestContentServlet)
#Ctrl+Cを押した時
trap("INT"){srv.shutdown}
srv.start
