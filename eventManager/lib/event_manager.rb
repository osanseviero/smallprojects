require "csv"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end


puts 'EventManger initialized'

contents = CSV.open "../event_atendees.csv", headers:true, header_converters: :symbol
contents.each{ |row|
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	puts name + " " + zipcode.to_s
}

