require 'rubygems'
require_relative 'controller'
require_relative 'router'
require 'pry'

class Gossip

	attr_accessor :content, :author

	def initialize(author, content)
  	@content = content
 		@author = author
	end

	def self.all
		all_gossips=Array.new

		File.foreach("db/gossip.csv") do |line| 
		gossip=Gossip.new(line.split(",")[0],line.split(",")[1])
		all_gossips.push(gossip)
		end
	
		return all_gossips
	end

	def save
		File.open("db/gossip.csv","a") do |line|
			line.puts "#{@author},#{@content}"
		end
	end

	def self.destroy_gossip(gossip_to_destroy)
		all_gossips=Gossip.all
		all_gossips.reject! {|goss| goss.content.chomp==gossip_to_destroy}
		file=File.open("db/gossip.csv", "w")
		all_gossips.each do |goss|
			file.puts "#{goss.author},#{goss.content}"
		end
		file.close		
	end
end

