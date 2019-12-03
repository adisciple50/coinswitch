require_relative "test_helper"
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

  def test_it_gets_supported_coins
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.pairs('eth','btc')
  end

  def test_it_gets_a_rate
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.rate('eth','btc')
  end

  def test_it_places_an_order
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.order('eth','btc',0.5,'35hK24tcLEWcgNA4JxpvbkNkoAcDGqQPsP','1FeexV6bAHb8ybZjqQMjJrcCrHGW9sb6uF')
  end

  def test_it_gets_orders_list
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.orders 1,100
  end

  def test_it_gets_an_order
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.orderid('33333333-6c9e-4c53-9a6d-55e089aebd04')
  end
  def test_it_gets_a_bulk_rate
    client = Coinswitch::Dynamic::DynamicClient.new
    refute_empty client.bulk_rate
  end

end
