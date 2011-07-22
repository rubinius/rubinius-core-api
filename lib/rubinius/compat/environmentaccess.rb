module Rubinius
  module EnvironmentAccess
    def getenv(key)
      ENV[key]
    end
    
    def setenv(key, value)
      ENV[key] = value
    end
    
    def environ_as_hash
      ENV.to_hash
    end
  end
end