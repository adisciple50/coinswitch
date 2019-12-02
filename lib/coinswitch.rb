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
      def initialize(ip_address=Ipify.ip,api_key=Coinswitch::SANDBOX_API_KEY,sandbox=true)
        ##
        # This Initialises the client and populates the coins list

        @ip_address = ip_address
        @api_key = api_key
        @sandbox = sandbox
        @coins = coins
      end

      attr_accessor

      def coins
      ##
      #   This gets a list of coins that are available for swapping

      end
      def pairs

      end
      def rate

      end

      def order

      end
      def orderid

      end
      def bulk_rate

      end
      def orders

      end
    end
  end
end
