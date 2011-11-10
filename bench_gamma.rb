require 'ffi'
require 'java'
require 'benchmark'

java_import 'Example'

module Gamma
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :tgamma, [:double], :double
end

include Benchmark

bmbm(30) do |bm|
  N = ARGV[0].nil? ? 1_000_000 : ARGV[0].to_i
  bm.report("pure_java") {
    N.times { x = Math.gamma(0.5) }
  }
  bm.report("JNI") {
    N.times { x = Java::Example.gamma(0.5) }
  }
  bm.report("FFI") {
    N.times { x = Gamma::tgamma(0.5) }
  }
end
