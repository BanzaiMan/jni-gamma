require 'ffi'
if defined? JRUBY_VERSION
  require 'java'
  java_import 'Example'
end
require 'benchmark'

module Gamma
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :tgamma, [:double], :double
end

include Benchmark

bmbm(30) do |bm|
  N = ARGV[0].nil? ? 1_000_000 : ARGV[0].to_i
  if defined? JRUBY_VERSION
    bm.report("pure_java") {
      N.times { x = Math.gamma(0.5) }
    }
    bm.report("JNI") {
      N.times { x = Java::Example.gamma(0.5) }
    }
  elsif RUBY_VERSION > "1.9"
    bm.report("native") {
      N.times { x = Math.gamma(0.5) }
    }
  end
  bm.report("FFI") {
    N.times { x = Gamma::tgamma(0.5) }
  }
end
