require './lib/enigma'

enigma = Enigma.new

text_file = File.open(ARGV[0], 'r')
read_text = text_file.read.chomp
text_file.close

decrypted_message = enigma.decrypt(read_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], 'w')
writer.write(decrypted_message[:decryption])
writer.close

puts "Created '#{ARGV[1]}' with the key: #{decrypted_message[:key]} and date: #{decrypted_message[:date]}"
