require 'rbconfig'
Gem::Specification.new do |s|
  s.name              = "libarchive-static"
  s.version           = ENV['BUILD_VERSION'].dup
  s.summary           = 'Ruby bindings for libarchive, statically linked with libarchive and zlib dependencies'
  s.description       = "The wrapper source originated from the 0.1.1 Ruby libarchive wrapper.  This package just static-links it with its libarchive and zlib dependencies, for the cross-platform convenience of 'gem install fig'."
  s.extensions        = ["ext/extconf.rb"]
  s.files             = Dir["ext/**/*"]
  s.require_paths     = %w(lib)
  s.author            = 'Samantha Tesla'
  s.email             = 'stesla@drwholdings.com'
  s.homepage          = 'http://github.com/fig-package-manager/libarchive-ruby-static'
  s.has_rdoc          = false
  s.rubyforge_project = 'libarchive-static'
end
