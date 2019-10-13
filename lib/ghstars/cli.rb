require 'thor'
require 'ghstars'

module Ghstars
  class CLI < Thor
    desc "version", "Version information"
    def version
      puts Ghstars::VERSION
    end
  end
end