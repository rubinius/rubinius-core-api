# -*- encoding: utf-8 -*-

base_specification = proc do |s|
  s.name = %q{rubinius-core-api}
  s.version = "0.0.2"
  s.authors = ["Charles Oliver Nutter", "Evan Phoenix"]
  s.date = Time.now
  s.description = "Cross-impl versions of interesting Rubinius core classes"
  s.email = ["headius@headius.com", "evan@fallingsnow.net"]
  s.files = Dir['{lib}/**/*'] + Dir['{*.txt,*.gemspec,Rakefile}']
  s.homepage = "http://github.com/rubinius/rubinius-core-api"
  s.require_paths = ["lib"]
  s.summary = "Cross-impl versions of interesting Rubinius core classes"
  s.test_files = Dir["test/test*.rb"]
end

if defined?(JRUBY_VERSION)
  Gem::Specification.new do |s|
    s.tap(&base_specification)
    s.platform = "java"
  end
else
  Gem::Specification.new do |s|
    s.tap(&base_specification)
  end
end
