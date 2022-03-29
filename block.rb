require 'digest'
require 'pp'

class Block
  attr_reader :data, :hash

  def initialize(data)
    @data = data
    @hash = Digest::SHA256.hexdigest(data)
  end
end

p Block.new('hello world!')

p Block.new('hello world again!')

p Block.new('Kaique')

p Block.new('Linhares')

p Block.new('Anime Anime Anime')


p Block.new(<TXT)
  Anime Anime Anime
  Anime Anime Anime
  Anime Anime Anime
  Anime Anime Anime
  Anime Anime Anime
TXT