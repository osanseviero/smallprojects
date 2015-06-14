require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
	legislator_names = legislators.collect{ |legislator|
		"#{legislator.first_name} #{legislator.last_name}"
	}
end


puts 'EventManger initialized'

contents = CSV.open "../event_atendees.csv", headers:true, header_converters: :symbol
contents.each{ |row|
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)
	puts "#{name} #{zipcode} #{legislators}"
}

