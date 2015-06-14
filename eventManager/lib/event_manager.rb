require "csv"

puts 'EventManger initialized'

contents = CSV.open "../event_atendees.csv", headers:true, header_converters: :symbol
contents.each{ |row|
	name = row[:first_name]
	zipcode = row[:zipcode]
	puts name + " " + zipcode.to_s
}