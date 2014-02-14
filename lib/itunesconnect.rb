$LOAD_PATH.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

require 'logger'
require 'itunesconnect/version'

module ITunesConnect
  extend self

  ITUNES_URL = "https://reportingitc.apple.com/autoingestion.tft"

  attr_accessor :logger
end

require 'itunesconnect/client'

# Log to STDOUT by default
ITunesConnect.logger = Logger.new(STDOUT)
