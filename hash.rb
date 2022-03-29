require 'digest'

p Digest::SHA256.hexdigest('hello world!')

p Digest::SHA256.hexdigest('Kaique')

p Digest::SHA256.hexdigest('Linhares')

p Digest::SHA256.hexdigest(<TXT)
  Anime Anime Anime
  Anime Anime Anime
  Anime Anime Anime
  Anime Anime Anime
  Anime Anime Anime
TXT

p Digest::SHA256.hexdigest('Kaique').length
p Digest::SHA256.hexdigest('Linhares').length

hex = Digest::SHA256.hexdigest('Kaique')

p hex.to_i(16)

p hex.to_i(16).to_s(2)
