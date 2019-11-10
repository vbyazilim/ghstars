require "test_helper"

class GhstarsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ghstars::VERSION
  end

  def test_user_must_define_github_token
    buffer_token = nil
    if ENV['GITHUB_TOKEN']
      buffer_token = ENV['GITHUB_TOKEN']
      ENV.delete('GITHUB_TOKEN')
    end
    assert_raises(::Ghstars::GitHubAccessTokenError) { ::Ghstars.check_github_token_defined }
    ENV['GITHUB_TOKEN'] = buffer_token if buffer_token
  end
  
  def test_wrong_credentials
    if ENV['GITHUB_TOKEN']
      buffer_token = ENV['GITHUB_TOKEN']
      ENV.delete('GITHUB_TOKEN')
    end
    ENV['GITHUB_TOKEN'] = "invalid-token"
    assert_raises(SystemExit) { ::Ghstars.github_access_available? }
    ENV['GITHUB_TOKEN'] = buffer_token if buffer_token
  end
end
