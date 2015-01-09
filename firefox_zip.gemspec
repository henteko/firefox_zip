lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firefox_zip/version'

Gem::Specification.new do |s|
  s.name        = 'firefox_zip'
  s.version     = FirefoxZip::VERSION
  s.summary     = "Firefox os app analyzer"
  s.description = "Firefox os app analyzer tool"
  s.authors     = ["henteko"]
  s.email       = 'henteko07@gmail.com'
  s.homepage    = 'https://github.com/henteko/firefox_zip'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rubyzip', '~> 1.1'
  s.add_runtime_dependency 'systemu', '~> 2.6'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'rspec', '~> 3.1'
end
