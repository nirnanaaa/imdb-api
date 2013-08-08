# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  
  s.name = "imdb-api"
  s.version = "0.0.1"

  s.author = "Florian Kasper"
  s.description = "Better IMDB client"
  s.email = "mosny@zyg.li"
  s.rubyforge_project = "imdb-api"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.homepage = "http://github.com/nirnanaaa/imdb-api"
  s.summary = "better IMDB client"

end