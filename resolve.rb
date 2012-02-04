#!/usr/bin/ruby

$root = File.dirname(__FILE__)

$LOAD_PATH << ($root)
$LOAD_PATH << ($root + "/../lib/")

require 'optparse'
require 'StubResolverIter'

rootserv = '192.41.162.32'
opts = OptionParser.new do |opts| 
  opts.on("-r", "--rootserv IP address or DNS name", String,
          "") { |r| rootserv = r}
end
opts.parse!(ARGV)

sr = StubResolverIter.new(rootserv)


tstartall = Time.now
sr.resolve(ARGV[0], ARGV[1])
querytime = (Time.now - tstartall).to_f
print "\n\n#Total Querytime: #{querytime} seconds\n"
