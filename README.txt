This is an attempt to provide some of Rubinius's additional core classes on
other implementations.

Rubinius has all the normal Ruby classes, but to support implementing them
mostly in Ruby, they have added a number of other support classes. This
library hopes to implement those additional support classes for other Ruby
implementations, so they their utility can be shared across implementations.

Currently, only the following classes are implemented, and only on JRuby:

Rubinius::ByteArray - a fixed-size array of bytes
Rubinius::Channel - a low-level synchronization mechanism
Rubinius::EnvironmentAccess - env variable support
Rubinius::Tuple - a fixed-size array of object references
Rubinius::Type - utilities for type conversions

In addition, some utility methods added to Thread for recursive guards and
Kernel::StringValue are also implemented.

More APIs will be added over time.