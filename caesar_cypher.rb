require 'pry'

puts 'What message would you like encrypted?'
message = gets.chomp.to_s

puts 'By how much would you like to shift your message?'
shift = gets.chomp
while shift.to_i.to_s != shift
  puts 'Please enter a valid integer:'
  shift = gets.chomp
end 
shift  = shift.to_i

def cypher(message, shift=0)
  lower_alphabet = ('a'..'z').to_a
  upper_alphabet = ('A'..'Z').to_a

	message_array = message.split('')
	shift = shift % 25
	cypher_array = []

	message_array.each do |char|
		if char == ' '
			cypher_array << char
		elsif char.upcase == char
			unshifted = upper_alphabet.find_index(char)
			shifted = (unshifted + shift) % 25
			cypher_array << upper_alphabet[shifted]
		else 
			unshifted = lower_alphabet.find_index(char)
			shifted = (unshifted + shift) % 25
			cypher_array << lower_alphabet[shifted]
		end
	end
	cyphered_message = cypher_array.join
	puts "your message: #{cyphered_message}"
end

cypher(message, shift)