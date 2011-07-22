# This leads to the fallback versions of the core API classes implemented
# entirely in Ruby, so they'll work where we don't have native versions
# just yet.

# Rubinius::Channel
require 'rubinius/kernel/bootstrap/channel'
require 'rubinius/compat/channel'
require 'rubinius/kernel/common/channel'

# Rubinius::Tuple
require 'rubinius/compat/tuple'
require 'rubinius/kernel/common/tuple'

# Kernel.StringValue
require 'rubinius/compat/kernel'

# Rubinius::Type
require 'rubinius/compat/type'
require 'rubinius/kernel/common/type'

# Rubinius::ByteArray
require 'rubinius/compat/bytearray'
require 'rubinius/kernel/common/bytearray'

# Rubinius::EnvironmentAccess
require 'rubinius/compat/environmentaccess'