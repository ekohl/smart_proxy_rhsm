require_relative 'lib/smart_proxy_rhsm/version'
require 'date'

Gem::Specification.new do |s|
  s.name        = 'smart_proxy_rhsm'
  s.version     = Proxy::Rhsm::VERSION
  s.date        = Date.today.to_s
  s.license     = 'GPL-3.0'
  s.authors     = ['Ewoud Kohl van Wijngaarden']
  s.email       = ['ewoud@kohlvanwijngaarden.nl']
  s.homepage    = 'https://github.com/theforeman/smart_proxy_rhsm'

  s.summary     = 'A Foreman Proxy RHSM plugin'
  s.description = 'The RHSM plugin allows Katello to do service discovery'

  s.files       = Dir['{config,lib,bundler.d}/**/*'] + ['README.md', 'LICENSE']
  s.test_files  = Dir['test/**/*']

  s.add_development_dependency('mocha')
  s.add_development_dependency('rack-test')
  s.add_development_dependency('rake')
  s.add_development_dependency('test-unit')
end
