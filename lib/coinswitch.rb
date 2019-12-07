require "coinswitch/version"
require 'ipify'
require 'httparty'

module Coinswitch
  SANDBOX_API_KEY = 't41E6v16mG6xqOUK74E2F7Py6UVng4K6n1pO3Jig'
  module Dynamic
    class Error < StandardError; end
  # Your code goes here...
    class DynamicClient
      ##
      # This class is a request constructor for coinswitch. It is the client for the dynamic api endpoints.
      include HTTParty
      base_uri 'https://api.coinswitch.co/v2'
      def initialize(ip_address=Ipify.ip,api_key=Coinswitch::SANDBOX_API_KEY)
        ##
        # This Initialises the client and populates the coins list

        @ip_address = ip_address
        @api_key = api_key
        @coins = coins
      end


      attr_accessor



      def coins
      ##
      #   This gets a list of coins that are available for swapping
        @@response = self.class.get('/coins',headers:{'x-api-key':@api_key,'x-user-ip':@ip_address})
        return JSON.parse @@response.body
      end

      def coins_list
        ##
        # Gets ONLY a list of symbols available for trade.
        @@coins_list = []
        @@coins = self.coins
        @@tomap = @@coins['data']
        @@tomap.map{|x| @@coins_list << x["symbol"] }
        return @@coins_list
      end

      def pairs(depositCoin,destinationCoin)
        ##
        # determines if pairs are valid if the response is ok
        @@response = self.class.post('/pairs',
                                     headers:{'x-api-key':@api_key,'x-user-ip':@ip_address},
                                     body:JSON.unparse({'depositCoin'=> depositCoin,
                                                        'destinationCoin' => destinationCoin}))
        return  JSON.parse @@response.body
      end
      def rate(depositCoin,destinationCoin)
        @@response = self.class.post('/rate',
                                     headers:{'x-api-key':@api_key,'x-user-ip':@ip_address},
                                     body:JSON.unparse({'depositCoin'=> depositCoin,'destinationCoin' => destinationCoin})
                                    )
        return JSON.parse @@response.body
      end

      def order(depositCoin,destinationCoin,depositCoinAmount,destinationAddress,refundAddress,callbackUrl='')
        @@response = self.class.post('/rate',
                                     headers:{'x-api-key':@api_key,'x-user-ip':@ip_address},
                                     body:JSON.unparse({'depositCoin'=> depositCoin,'destinationCoin' => destinationCoin, 'depositCoinAmount' => depositCoinAmount,'destinationAddress' => destinationAddress,'refundAddress' => refundAddress,'callbackUrl' => callbackUrl})
        )
        return JSON.parse @@response.body
      end
      def orderid(orderid)
        @@response = self.class.get('/order/'+ orderid.to_s,headers:{'x-api-key':@api_key,'x-user-ip':@ip_address},query:{'orderid'=> orderid})
        return JSON.parse @@response.body
      end
      def bulk_rate(input)
        ##
        # https://developer.coinswitch.co/reference#post-v2bulk-rate
        @@response = self.class.post('/rate',
                                     headers:{'x-api-key':@api_key,'x-user-ip':@ip_address},
                                     body:JSON.unparse(input)
        )
        return JSON.parse @@response.body
      end
      def orders(start,count)
        @@response = self.class.get('/coins',headers:{'x-api-key':@api_key,'x-user-ip':@ip_address},query:{'start'=> start,'count' => count})
        return JSON.parse @@response.body
      end
    end
  end
end

# client = Coinswitch::Dynamic::DynamicClient.new
# puts client.orderid('11111111-6c9e-4c53-9a6d-55e089aebd04')