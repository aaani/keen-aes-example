begin
  require 'bundler/setup'
rescue LoadError
  puts "Use of bundler is recommended"
end

require 'rspec'
require File.expand_path("../../lib/keen/scopedkey", __FILE__)

