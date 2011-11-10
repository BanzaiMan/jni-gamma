import java.util.*;

class Example {
  native static double gamma(double x);

  static {
    System.loadLibrary("gamma");
  }

  public static void main(String args[]) {
    System.out.println(gamma(0.5));
  }
}
