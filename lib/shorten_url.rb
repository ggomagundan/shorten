# Simple bijective function
# Basically encodes any integer into a base(n) string,
# where n is ALPHABET.length.

module ShortenUrl
  ALPHABET =
  # "2bkczKrLH5sB0wAimQjDSNRg1uWaTF93MV6Y8tneGIEdvZXPUxholqypC4OJf7"
  "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

  # make your own alphabet using:
  # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join

  def encode_url(i)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def decode_url(s)
    # based on base2dec() in Tcl translation
    # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
    i = 0
    base = ALPHABET.length
    s.each_char { |c| i = i * base + ALPHABET.index(c) }
    i
  end

  module_function :encode_url
  module_function :decode_url

=begin
  # Two little demos:

  require 'shorten_url'
  ShortenUrl.encode_url(Time.now.to_i)
  => "b6D784"

  # Decoding string mentioned in original SO question:
  puts  ShortenUrl.decode_url("b6D784")
  => 1423293261
=end
end
