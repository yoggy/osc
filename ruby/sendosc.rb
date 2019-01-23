#!/usr/bin/ruby
require 'ruby-osc'

client = OSC::Client.new(7777, "127.0.0.1")
client.send OSC::Message.new("/test", 1234, 123.456, "test1234")

