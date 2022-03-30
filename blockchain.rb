require 'digest'
require 'pp'

class Block
  attr_reader :data, :prev, :hash, :nonce

  def initialize(data, prev)
    @data = data
    @prev = prev
    @nonce, @hash = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficulty = '0000')
    nonce = 0
    loop do
      hash = Digest::SHA256.hexdigest("#{nonce}#{data}#{prev}")
      if hash.start_with?(difficulty)
        return [nonce, hash]
      else
        nonce += 1
      end
    end
  end
end

p b0 = Block.new('hello world!', '0000000000000000000000000000000000000000000000000000000000000000')

p b1 = Block.new('hello world again!', b0.hash)

p b2 = Block.new('Kaique', b1.hash)

p b3 = Block.new('Linhares', b2.hash)

p b4 = Block.new('Anime Anime Anime', b3.hash)

blockchain = [b0, b1, b2, b3, b4]

pp blockchain

p b0.prev == '0000000000000000000000000000000000000000000000000000000000000000'
p b1.prev == b0.hash
p b2.prev == b1.hash
p b3.prev == b2.hash

p b0.hash == Digest::SHA256.hexdigest("#{b0.nonce}#{b0.prev}#{b0.data}")
p b1.hash == Digest::SHA256.hexdigest("#{b1.nonce}#{b1.prev}#{b1.data}")
p b2.hash == Digest::SHA256.hexdigest("#{b2.nonce}#{b2.prev}#{b2.data}")
p b3.hash == Digest::SHA256.hexdigest("#{b3.nonce}#{b3.prev}#{b3.data}")

p b0.hash.start_with?('0000')
p b1.hash.start_with?('0000')
p b2.hash.start_with?('0000')
p b3.hash.start_with?('0000')

b1 = Block.new('Hello, world!', b0.hash)

b0.prev == '0000000000000000000000000000000000000000000000000000000000000000'

b1.prev == b0.hash

b2.prev == b1.hash

b3.prev == b2.hash
