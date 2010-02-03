require 'rubygems'
require 'open-uri'
require 'cgi'
require 'kconv'
require 'hpricot'

API = "http://www.google.co.jp/search?num=3&lr=lang_ja&oe=utf-8&q="	

def google_search(message)

  #googleSearch
  word = message.toutf8.sub('pre g ','')
  url = "#{API}#{CGI.escape(word)}"
  html = open(url).read
  #pp html
  doc = Hpricot(html)
  #pp doc/"li.g/h3.r"
  (doc/"li.g/h3.r/a.l").each do |element|
    p element.inner_text
  end
  
  #puts doc
  #p doc
  #result = doc / 'li.g'
  #puts result
  #out = []
  #i = 1
 # result.each_with_index{|div,idx|
 #   break if i==4
 #  next if div.attributes['style']
 #   link = div.at 'a'
 #   text = CGI.unescapeHTML(link.inner_html.gsub(%r!<b>([^<]*)</b>!) {$1})
 #   href = link[:href]
 #   out = "#{text} #{href}"
    #pp out
 #   puts out
 #   puts '\n' * 3
#    post NOTICE, @channel, out.gsub('<em>','').gsub('</em>','').tojis
 #  i += 1
#  }

  #ans = ""
  #out.each{|data|
  #		ans += data.to_s + " \n "       
  #		}
  #		puts ans
  #		post NOTICE, @channel,ans.gsub('<em>','').gsub('</em>','').tojis 
end



google_search(ARGV[0].to_s)
