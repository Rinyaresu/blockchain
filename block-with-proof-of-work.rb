require 'digest'
require 'pp'

class Block
  attr_reader :data, :hash, :nonce

  def initialize(data)
    @data = data
    @nonce, @hash = compute_hash_with_proof_of_work
  end

