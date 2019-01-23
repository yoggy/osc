#!/usr/bin/ruby
require 'ruby-osc'

OSC.run do
  server = OSC::Server.new(7777)

  server.add_pattern "/test" do |*args|
    addr  = args[0]  # /test
    val_i = args[1]  # int
    val_f = args[2]  # float
    val_s = args[3]  # string

    puts "addr=#{addr}, val_i=#{val_i}, val_f=#{val_f}, val_s=#{val_s}"
  end
end
