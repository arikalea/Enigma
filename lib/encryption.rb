require './lib/enigma'

enigma = Enigma.new

text_file = File.open(ARGV[0], 'r')
read_text = text_file.read
message = gets.chomp
text_file.close

encrypted_message = enigma.encrypt(message)

writer = File.open(ARGV[1], 'w')
writer.write(encrypted_message[:encryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
