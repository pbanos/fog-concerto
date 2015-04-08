# encoding: UTF-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog-concerto/version'

Gem::Specification.new do |s|
	s.name = 'fog-concerto'
	s.version = Fog::Concerto::VERSION
	s.date = '2015-04-01'
	s.summary = %q{Module for the 'fog' gem to support Flexiant Concerto.}
	s.description = %q{This library can be used as a module for `fog` or as standalone provider to use Flexiant Concerto in applications..}
	s.authors = ['Pablo Baños López']
	s.email = 'pbanos@flexiant.com'
	s.homepage = ''
	s.license = ''
	s.files = Dir['{bin,lib,spec,features}/**/*'] + Dir['{LICENSE,README,ROADMAP,CHANGELOG}.md']
	s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
	s.test_files = s.files.grep(%r{^(test|spec|features)/})
	s.require_paths = ["lib"]

	s.add_dependency 'fog-core',  '~> 1.27'
	s.add_dependency 'fog-json',  '~> 1.0'

	s.add_development_dependency 'bundler', '~> 1.6'
	s.add_development_dependency 'rake',    '~> 10.0'
end