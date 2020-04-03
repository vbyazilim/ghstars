require "ghstars/version"
require 'octokit'

module Ghstars
  @@client = nil
  class GitHubAccessTokenError < StandardError; end
  class GitHubBadCredentialsError < StandardError; end
  class InvalidOwnerError < StandardError; end

  class Error < StandardError; end

  def self.check_github_token_defined
    raise ::Ghstars::GitHubAccessTokenError, "Please define GITHUB_TOKEN environment variable." unless ENV['GITHUB_TOKEN']
  end

  def self.check_github_credentials
    begin
      @@client.user
    rescue Octokit::Unauthorized => error_message
      puts error_message
      raise ::Ghstars::GitHubBadCredentialsError, "Bad GitHub credentials."
    end
  end

  def self.github_access_available?
    begin
      ::Ghstars.check_github_token_defined
    rescue ::Ghstars::GitHubAccessTokenError => error_message
      puts error_message
      exit
    end

    @@client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
    @@client.auto_paginate = true
    
    begin
      ::Ghstars.check_github_credentials
    rescue ::Ghstars::GitHubBadCredentialsError => error_message
      puts error_message
      exit
    end
    true
  end

  def self.get_repos(options)
    if ::Ghstars.github_access_available?
      query = options[:query]
      repos = @@client.repos({}, query: query)
        .reject{|r| r[:stargazers_count] == 0}
        .reject{|r| r[:fork]}
        .sort_by{|r| r[:stargazers_count]}
        .reverse
        repos
    end
  end
  
end
