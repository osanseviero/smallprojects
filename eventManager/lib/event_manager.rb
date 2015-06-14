require "csv"

def clean_zipcode(zipcode)
	if zipcode.nil?
		zipcode = '00000'
	elsif zipcode.length < 5
    zipcode = zipcode.rjust 5, "0"
  elsif zipcode.length > 5
    zipcode = zipcode[0..4]
  end
end


puts 'EventManger initialized'

contents = CSV.open "../event_atendees.csv", headers:true, header_converters: :symbol
contents.each{ |row|
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	puts name + " " + zipcode.to_s
}

