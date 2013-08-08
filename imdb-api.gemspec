# -*- encoding: utf-8 -*-
lib = "imdb-api"
lib_file = File.expand_path("../lib/#{lib}.rb", __FILE__)
File.read(lib_file) =~ /\bVERSION\s*=\s*["'](.+?)["']/
version = $1

Gem::Specification.new do |s|
  
  s.name = lib
  s.version = version
  s.rubyforge_project = lib
  
  s.author = "Florian Kasper"
  s.description = "Better IMDB client"
  s.email = "mosny@zyg.li"
  

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.homepage = "http://github.com/nirnanaaa/imdb-api"
  s.summary = "better IMDB client"
  
  s.add_dependency 'json', '~> 1.8.0'
  s.add_dependency 'faraday', '~> 0.8.8'
  s.add_dependency 'hashr', '~> 0.0.22'
  
end