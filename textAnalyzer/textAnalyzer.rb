# This text analyzer has the next features
	# Character count with and without spaces
	# Line and word count
	# Sentence and paragraph count
	# Avg of words per sentence and sentences per paragraph
	# Percentage of useful words
	# A summarizer

# Loading and getting line count
lines = File.readlines("test.txt")
line_count = lines.size

# Counting characters
text = lines.join
total_characters = text.length
total_characters_nospaces = text.gsub(/\s/,'').length

# Counting words, sentences and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

# Percentage of useful words
all_words = text.scan(/\w+/)
stopwords = %w{the a by on for of are with just but and to the my I has some in}
good_words = all_words.select {|word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

# Summarize the text by picking some specific sentences
sentences = text.gsub(/\s+/,' ').split(/\.|\?|!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length/3
ideal_sentences = sentences_sorted.slice(one_third, one_third +1)
ideal_sentences = ideal_sentences.select {|sentence| sentence = /is|are/}

# Info
puts line_count.to_s + " lines"
puts total_characters.to_s + " characters"
puts total_characters_nospaces.to_s + " characters excluding spaces"
puts word_count.to_s + " total words"
puts sentence_count.to_s + " total sentences"
puts paragraph_count.to_s + " total pararaphs"
puts (sentence_count/paragraph_count).to_s + " average of sentences per paragraph"
puts (word_count/sentence_count).to_s + " average of words per sentence"
puts "#{good_percentage}% of useful words"
puts "Summary: \n\n" + ideal_sentences.join(". ")
