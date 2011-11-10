#include "Example.h"
#include <math.h>

JNIEXPORT jdouble JNICALL Java_Example_gamma(JNIEnv * env, jclass jclass, jdouble jdbl) {
  return tgamma(jdbl);
}
