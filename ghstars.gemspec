lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ghstars/version"

Gem::Specification.new do |spec|
  spec.name          = "ghstars"
  spec.version       = Ghstars::VERSION
  spec.authors       = ["Uğur Özyılmazel"]
  spec.email         = ["ugurozyilmazel@gmail.com"]

  spec.summary       = %q{Show public git repositories star count of given GitHub username}
  spec.description   = %q{Show public git repositories star count of given GitHub username}
  spec.homepage      = "https://github.com/vbyazilim/ghstars"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vbyazilim/ghstars.git"
  spec.metadata["changelog_uri"] = "https://github.com/vigo/gh-issues/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.4", ">= 1.4.1"
  spec.add_development_dependency "pry", "~> 0.12.2"

  spec.add_runtime_dependency "terminal-table", "~> 1.8"
  spec.add_runtime_dependency "thor", "~> 0.20.3"
  spec.add_runtime_dependency "octokit", "~> 4.14"
end