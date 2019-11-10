require 'thor'
require 'ghstars'
require 'terminal-table'

module Ghstars
  class CLI < Thor
    class_option :verbose, type: :boolean, default: false

    desc "version", "Version information"
    def version
      puts Ghstars::VERSION
    end

    desc "show", "Shows your public repositories total star count"
    long_desc <<-LONGDESC
      Just returns the count\n
      
      Examples:\n
      $ ghstars show\n
      $ ghstars show --verbose\n
    LONGDESC
    def show
      puts "Fetching repositories, please hold..." if options[:verbose]

      query = {visibility: 'public', affiliation: 'owner'}
      repos = Ghstars.get_repos(query: query)
      star_count = repos.map{|r| r[:stargazers_count]}.sum
      if options[:verbose]
        puts "You have #{star_count} #{star_count > 1 ? "stars" : "star"}"
      else
        puts star_count
      end
    end
    
    desc "list [AMOUNT]", "List your public repositories total star count in detail"
    long_desc <<-LONGDESC
      Display all of your repositories names and star counts\n

      Examples:\n
      $ ghstars list\n
      $ ghstars list --verbose\n
      $ ghstars list 5 # show top 5\n
    LONGDESC
    def list(top_repos=0)
      top_repos = top_repos.to_i if is_numeric?(top_repos)
      puts "Fetching repositories, please hold..." if options[:verbose]
      query = {visibility: 'public', affiliation: 'owner'}
      repos = Ghstars.get_repos(query: query)
      repos = repos[0..(top_repos-1)] if top_repos > 0
      puts tabelize(repos, top_repos)
    end

    no_commands do
      def is_numeric?(input)
        input.to_f.to_s == input.to_s || input.to_i.to_s == input.to_s
      end

      def tabelize(repos, top_repos)
        star_count = repos.map{|r| r[:stargazers_count]}.sum
        footer_text = top_repos > 0 ? "Total count of selection" : "Total count"
        table = Terminal::Table.new do |t|
          t.add_row [
            {value: '#'},
            {value: 'Name of Repository'},
            {value: 'Star'}
          ]
          t.add_separator
          repos.each_with_index do |repo, index|
            t.add_row [
              {value: index+1},
              {value: repo[:full_name]},
              {value: repo[:stargazers_count], alignment: :right}
            ]
          end
        end
        table.add_separator
        table.add_row ['', {value: footer_text}, {value: star_count, alignment: :right}]
        table
      end
    end

  end
end