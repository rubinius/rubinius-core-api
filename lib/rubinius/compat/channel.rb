require 'thread'
require 'timeout'

module Rubinius
  # Channel implemented as a thin layer around Queue
  class Channel
    def initialize
      @queue = Queue.new
    end
    
    def send(object)
      @queue.push(object)
    end
    alias << send
    
    def receive
      @queue.pop
    end
    
    def receive_timeout(t)
      return receive if t == -1
      
      Timeout.timeout(t) do
        receive
      end
    end
    
    def try_receive
      @queue.pop(false)
    rescue ThreadError
      nil
    end
  end
end