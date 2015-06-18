require 'jumpstart_auth'
require 'bitly'
require 'klout'
# 7198080
class MicroBlogger
	attr_reader :blog

	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
		Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'
	end

	def tweet(message)
		@client.update(message)
	end

	def dm(target, message)
		puts "Trying to send #{target} this direct message:"
		puts message
		
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }

		if screen_names.include? target
			message = "@#{target} #{message}"
			tweet(message)
		else 
			puts "You can only DM people that follows you"
		end
	end

	def followers_list()
		screen_names = []
    @client.followers.each do |follower|
      screen_names << @client.user(follower).screen_name
    end
    return screen_names
	end

	def spam_my_followers(message)
		followers = followers_list
		followers.each{ |follower|
			dm(follower, message)
		}
	end

	def everyones_last_tweet
		friends = @client.friends.sort_by { |friend| @client.user(friend).screen_name.downcase }
		friends.each do |friend|
		  timestamp = @client.user(friend).status.created_at
		  timestamp = timestamp.strftime("%A, %b %d")
		  name = @client.user(friend).screen_name
		  tweet = @client.user(friend).status.text
		  puts "#{name} said this on #{timestamp}"	
		  puts tweet
		  puts ''											
		end
	end

	def shorten(original_url)
		Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')  
    puts "Shortening this URL: #{original_url}"
    return bitly.shorten(original_url).short_url
	end

	def klout_score
    friends = @client.friends.collect { |f| @client.user(f).screen_name }
    friends.each do |friend|
      begin
        identity = Klout::Identity.find_by_screen_name(friend)
        user = Klout::User.new(identity.id)
        puts "#{friend}: #{user.score.score}\n"
      rescue
        puts "User #{friend} score not available."
      end
    end
  end


	def run
		puts "Welcome to the JSL Twitter Client"
		command = ''
		while command != 'q'
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
				when 'q' then puts "Goodbye!"
				when 't' then tweet(parts[1..-1].join(" "))
				when 's' then shorten(parts[1..-1].join(" "))
				when 'dm' then dm(parts[1], parts[2..-1].join(" "))
				when 'spam' then spam_my_followers(parts[1..-1].join(" "))
				when 'elt' then everyones_last_tweet
				when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
				when 'klout' then klout_score
				else
					puts "Sorry, I don't know how to #{command}"
				end
		end
	end

	
end

blogger = MicroBlogger.new
puts blogger.run










