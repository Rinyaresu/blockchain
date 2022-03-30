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
