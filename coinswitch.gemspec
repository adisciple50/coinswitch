lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coinswitch/version"

Gem::Specification.new do |spec|
  spec.name          = "coinswitch"
  spec.version       = Coinswitch::VERSION
  spec.authors       = ["Jason Crockett"]
  spec.email         = ["JesusisLord33333@outlook.com"]

  spec.summary       = 'A ruby library implementation of the coinswitch api'
  spec.description   = 'A ruby library implementation of the coinswitch api'
  spec.homepage      = "https://github.com/adisciple50/coinswitch"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/adisciple50/coinswitch/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'ipify'
  spec.add_dependency 'httparty'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
