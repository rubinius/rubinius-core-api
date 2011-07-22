module Rubinius
  # Others are errors for now
  def const_missing(name)
    if %w[ByteArray EnvironmentAccess, Type].include? name.to_s
      raise "Rubinius::#{name} not yet supported under this Ruby impl"
    end
    super
  end
end