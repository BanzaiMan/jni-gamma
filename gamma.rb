require 'ffi'

module Gamma
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :tgamma, [:double], :double
end

puts Gamma::tgamma(0.5)
