require 'csv'
require 'pry'

class Gossip

	attr_accessor :author, :content
	def initialize(author, content)
		@author = author
		@content = content
	end	

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author,@content]
		end
	end

	def update(nb, new_content)
		@content = new_content
	end

	def self.find_gossip(nb)
		CSV.read("./db/gossip.csv").each_with_index do |line, i|
		if i+1 == nb
			return Gossip.new(line[0], line[1])
		end
		end
	end

	def self.all
  	all_gossips = []
  	CSV.read("./db/gossip.csv").each do |csv_line|
    	all_gossips << Gossip.new(csv_line[0], csv_line[1])
  	end
  	return all_gossips
	end

end

