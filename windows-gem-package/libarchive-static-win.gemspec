require 'rbconfig'
Gem::Specification.new do |s|
  s.name              = "libarchive-static" + (RUBY_VERSION =~ /1.8/ ? "-ruby186" : "")
  s.version           = ENV['BUILD_VERSION'].dup
  s.platform          = ENV['RUBY_PLATFORM']
  s.summary           = 'Ruby bindings for Libarchive.'
  s.description       = 'Ruby bindings for Libarchive, yeah.'
  s.require_paths     = %w(lib)
  s.files             = %w(lib/libarchive_ruby.so README.txt libarchive.c)
  s.author            = 'Samantha Tesla'
  s.email             = 'stesla@drwholdings.com'
  s.homepage          = 'http://github.com/fig-package-manager/libarchive-ruby-static'
  s.has_rdoc          = false
  s.rubyforge_project = 'libarchive-static'
end
