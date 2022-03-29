require 'digest'
require 'pp'

class Block
  attr_reader :data, :hash, :nonce

  def initialize(data)
    @data = data
    @nonce, @hash = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficult = '0000')
    nonce = 0
    loop do
      hash = Digest::SHA256.hexdigest("#{data}#{nonce}")
      return nonce, hash if hash.start_with?(difficult)

      nonce += 1
    end
  end
end

p Block.new('hello world!')

p Block.new('hello world again!')

p Block.new('Kaique')

p Block.new('Linhares')

p Block.new('Anime Anime Anime')

Digest::SHA256.hexdigest('26762hello world!')

Digest::SHA256.hexdigest('68419hello world again!')

Digest::SHA256.hexdigest('23416Kaique')

Digest::SHA256.hexdigest('23416Linhares')

Digest::SHA256.hexdigest('15353Anime Anime Anime')
