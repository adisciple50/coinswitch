require "test_helper"
require_relative '../lib/coinswitch'
class CoinswitchTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Coinswitch::VERSION
  end

  def test_it_gets_a_coins_list
    client = Coinswitch::Dynamic::DynamicClient.new
    coins = client.coins
    refute_empty coins
  end

  def test_it_gets_orders_list
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.order
  end

end
