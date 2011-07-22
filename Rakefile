task :default => :spec

if defined?(JRUBY_VERSION)
  require 'ant'

  directory "pkg/classes"

  desc "Clean up build artifacts"
  task :clean do
    rm_rf "pkg/classes"
    rm_rf "lib/rubinius-core-api.jar"
  end

  desc "Compile the extension"
  task :compile => "pkg/classes" do |t|
    ant.javac :srcdir => "src", :destdir => t.prerequisites.first,
      :source => "1.5", :target => "1.5", :debug => true,
      :classpath => "${java.class.path}:${sun.boot.class.path}"
  end

  desc "Build the jar"
  task :jar => :compile do
    ant.jar :basedir => "pkg/classes", :destfile => "lib/rubinius-core-api.jar", :includes => "**/*.class"
  end
 
  task :package => :jar
else
  task :package do
    # nop
  end
end

desc "Run the specs"
task :spec => :package do
  ruby "-S", "rspec", "spec"
end