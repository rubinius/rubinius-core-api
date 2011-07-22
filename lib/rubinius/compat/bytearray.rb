module Rubinius  
  # TODO: error cases, testing
  class ByteArray
    def intialize(size_or_ary)
      if Array === size_or_ary
        @array = size_or_ary
      else
        @array = Array.new(size)
      end
    end
    
    class << self
      alias allocate_sized new
    end
    
    def fetch_bytes(start, count)
      ByteArray.new(@array[start, count])
    end
      
    def move_bytes(start, count, dest)
      @array[dest, count] = @array[start, count]
      
      count
    end
    
    def get_byte(index)
      @array[index]
    end
    
    def set_byte(index, value)
      @array[index] = value
    end
    
    def compare_bytes(other, self_limit, other_limit)
      self_limit = size if self_limit > size
      other_limit = other.size if other_limit > other.size
      limit = self_limit < other_limit ? self_limit : other_limit
      
      cmp = @array[0, limit] <=> other._array[0, limit]
      
      return cmp != 0 ? cmp : self_limit <=> other_limit
    end
    
    def size
      @array.size
    end
    
    def locate(pattern, start, max)
      len = pattern.length
      return start if len == 0
      
      max = size if max > size || max == 0
      max -= len - 1
      
      i = start
      while i < max
        if @array[i] == pattern[0]
          j = 1
          while j < len
            break if @array[i + j] != pattern[j]
          end
          
          return i + len if j == len
        end
      end
      
      nil
    end
    
    def prepend(other)
      ba = ByteArray.new(size + other.size)
      ba._array[0, str.size] = other._array
      ba._array[str.size, size] = @array
      ba
    end
    
    def reverse
      ba = ByteArray.new(size)
      ba._array[0, size] = @array.reverse
    end
    
    def _array
      @array
    end
    private :_array
  end
end