require './lib/enigma'
require './lib/decryption'

enigma = Enigma.new
decryption = Decryption.new
encrypted = File.open(ARGV[0], "r").read
new_file = File.open(ARGV[1], "w")
key = File.open(ARGV[2], "r").read
date = File.open(ARGV[3], "r").read

decrypt = enigma.decrypt(encrypted)
new_file.write(decrypt[:decryption])
new_file.close


puts "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}."
