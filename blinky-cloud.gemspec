$:.push File.expand_path("../lib", __FILE__)
require "blinky_cloud/version"

Gem::Specification.new do |s|
  s.name        = 'blinky-cloud'
  s.version     = BlinkyCloud::VERSION
  s.summary     = "blinky-cloud"
  s.description = "A Ruby interface for blinky-cloud"
  s.authors     = ["Jade Meskill", "Roy van de Water", "Clayton Lengel-Zigich"]
  s.email       = 'dev@integrumtech.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "blinky-tape-test-status"

  s.homepage    =
    'http://rubygems.org/gems/blinky-cloud'
  s.license       = 'MIT'
end
