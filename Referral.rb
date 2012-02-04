#!/usr/bin/ruby

require 'resolv-pset'

class Referral

  attr_reader :name

  def initialize(name)
    @name = name
  end

end
