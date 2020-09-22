require './lib/enigma'

enigma = Enigma.new
message = File.open(ARGV[0], "r").read
new_file = File.open(ARGV[1], "w")
encryption = enigma.encrypt(message)
new_file.write(encryption[:encryption])
new_file.close
puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}."
