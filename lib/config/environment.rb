
require 'bundler/setup'
Bundler.require

require 'dotenv'
Dotenv.load

require 'open-uri'
require 'net/http'
require 'json'
require 'pry'

import 'api_key.rb'


require_all './lib'