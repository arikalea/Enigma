require './lib/enigma'


original_message = File.open(ARGV[0], 'r')
message = handle.read
handle.close

enigma = Enigma.new
encrypted_message = enigma.encrypt(original_message)

writer = File.open(ARGV[1], 'w')
writer.write(encrypted_message[:encryption])
writer.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
