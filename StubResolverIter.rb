#!/usr/bin/ruby

require 'resolv-pset'
require 'time'



class StubResolverIter

  def initialize(rootserv)
    @rootserv = rootserv

    @resources = { 'a' => Resolv::DNS::Resource::IN::A,
      'ns' =>  Resolv::DNS::Resource::IN::NS,
      'mx' =>  Resolv::DNS::Resource::IN::MX,
      'ptr' =>  Resolv::DNS::Resource::IN::PTR,
      'txt' =>  Resolv::DNS::Resource::IN::TXT,
      'cname' =>  Resolv::DNS::Resource::IN::CNAME
    }

  end

  def resolve(dnsname, type=nil, nameserver=nil) 

    # go to the root if no other nameserver is specified
    # (i.e., we're not recursing)
    if (nameserver==nil)
      nameserver = @rootserv
    end

    # Fully qualify the domain name if it is not already done
    if (dnsname !~ /\.$/) then
      dnsname = sprintf("%s.", dnsname)
    end
    print "\nResolving #{dnsname} at #{nameserver}\n"
    tstart = Time.now

    Resolv::DNS.open(:nameserver => [nameserver],
                     :search => ['#{dnsname}'],
                     :ndots => 0) do |dns|

      res = dns.getresources("#{dnsname}",
                       Resolv::DNS::Resource::IN::ANY)
      

      querytime = (Time.now - tstart).to_f
      print "#Querytime: #{querytime} seconds\n"

      res.each { |r|


        if (type==nil) 
        elsif (r.kind_of?(Referral)) then

		# YOUR CODE HERE

        elsif (r.kind_of?(@resources['cname'])) then

		# YOUR CODE HERE

        elsif (r.kind_of?(@resources[type])) then

		# YOUR CODE HERE

        end

      }
      
   end
  end

end
