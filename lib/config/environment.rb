
require 'bundler/setup'
Bundler.require

require 'open-uri'
require 'net/http'
require 'json'
require 'pry'
require 'colorize'

import 'api_key.rb'


require_all './lib'