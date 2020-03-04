require 'open-uri'
require 'nokogiri'
url = 'https://trello-attachments.s3.amazonaws.com/5e562669f5aa49068ea4ce20/5e562669f5aa49068ea4ce46/x/e2b6463a3ecdf640d2e23dd592794529/mddrive.xml'

names_list = Array.new

doc = Nokogiri::XML(open(url))
p_parents = doc.xpath('//system','//point','//template','//workers','//worker', '//settings', '//param')
p_parents.each do |node|
  if node.first_element_child
    names_list.push node.attr('name')
  end
end

names_list.uniq!

 File.open('results_for_task1_1.txt', 'w+') do |i|
	 #names_list.each { |el| i.puts(el)}
	 i.puts(names_list)
 end