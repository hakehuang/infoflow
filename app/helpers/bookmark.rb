#!/home/ubuntu/.rvm/rubies/ruby-1.9.2-p318/bin/ruby

require 'rubygems'
require 'nokogiri'

class Parser

def parser(item, links, tag)
  item.css('a').each do |link|
	#puts "#{link.content.encode("UTF-8")}, #{link['href']}"
	if links.has_key?(link.content.encode("UTF-8"))
		if links[link.content.encode("UTF-8")][0] != link['href']
			info = Array.new()
			info.insert(-1,link['href'])
			tags = Array.new()
			tags.insert(-1, tag).uniq!()
			info.insert(-1,tags)
			info.uniq!()
        		links[link.content.encode("UTF-8") + "_2"] = info
		else
			links[link.content.encode("UTF-8")][1].insert(-1,tag).uniq!()
		end
	else
		info = Array.new()
		info.insert(-1,link['href'])
		tags = Array.new()
		tags.insert(-1, tag)
		info.insert(-1,tags)
		links[link.content.encode("UTF-8")] = info
	end
  end 
end

end

class  Bookmark < Parser
attr_accessor  :name, :link, :date_created, :tags, :icon, :rating, :comment, :ie_hash,:tag

def do_ie_folder(item, links)
	if item.attributes.has_key?("folded")
		#puts item.text
		@tag = item.text
	end
	item.children.each do |cc|
		#puts "tag is #{tag}"
		parser(cc,links,@tag)
		do_ie_folder(cc, links)
	end
end

def ie_parser(infile)
  @doc = Nokogiri::HTML(File::open(infile),nil,"UTF-8")
  @ie_hash = Hash.new()
  #puts @doc.css("title").text
  @doc.css('dl').each do |con|	
	do_ie_folder(con,@ie_hash)
  end

end

end

#main

#if ARGV.length < 1
#  puts "need file path"
#  exit
#end

#myparser = Bookmark.new()
#myparser.ie_parser(ARGV[0])
#myparser.ie_hash.each do |key,value|
#puts "#{key} => #{value}" 
