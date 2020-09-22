require './lib/enigma'

enigma = Enigma.new
decryption = Decryption.new
encrypted = File.open(ARGV[0], "r").read
new_file = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV[3]
decrypt = decryption.decrypt(encrypted)
new_file.write(decrypt[:decryption])
new_file.close
puts "Created '#{ARGV[1]}' with the key #{decrypt[:key]} and date #{decrypt[:date]}."
