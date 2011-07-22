module Rubinius
  module Type
    def object_kind_of?(obj, cls)
      obj.class <= cls
    end
  end
end