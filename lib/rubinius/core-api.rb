if defined?(JRUBY_VERSION)
  begin
    require 'rubinius-core-api.jar'
  rescue LoadError
    # keep going; might be bundled into classpath already
  end
  
  # for access to JRuby runtime
  require 'jruby'
  
  org.jruby.ext.rubinius.RubiniusLibrary.new.load(JRuby.runtime, false)
elsif defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
  # do nothing for Rubinius
else
  raise "Only supported on JRuby and Rubinius"
end