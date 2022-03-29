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

