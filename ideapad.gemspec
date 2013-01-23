# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ideapad/version"

Gem::Specification.new do |s|
  s.name        = "ideapad"
  s.version     = Ideapad::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex Sharp"]
  s.email       = ["ajsharp@gmail.com"]
  s.homepage    = "https://github.com/ajsharp/ideapad"
  s.summary     = %q{Tiny utility for keeping track of ideas.}
  s.description = %q{Tiny utility for keeping track of ideas.}

  s.rubyforge_project = "ideapad"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end