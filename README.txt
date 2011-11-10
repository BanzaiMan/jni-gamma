This is a simple example of the use of JNI. This shows how Java can call
the native function tgamma() to get the Gamma function value.

To use:
1. Generate Example.h:
  javah Example.java
2. Generate shared object from gamma.c. For example (on a Mac):
  cc -shared gamma.c -o libgamma.dylib \
    -I /Library/Java/JavaVirtualMachines/1.6.0_29-b11-397.jdk/Contents/Headers/
3. Compile Example.java:
  javac Example.java
4. Execute!
  java Example

Note: if you want to be sure that tgamma() is returning a reasonable
value, try tgamma(5.0) = 4! = 24, tgamma(0.5)**2 = Math.Pi()

For comparison, we do the same with (J)Ruby, using FFI. For MRI, you
would need to require 'rubygems' as well.

Note: In Ruby 1.9, the gamma function is available as 'Math::gamma'.
