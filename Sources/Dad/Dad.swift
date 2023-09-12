/// Repeats the same code a number of times that you specify
///
/// If you're struggling with `while` loops, this is a simpler alternative. If you wanted to print
/// `"Hello world"`5 times you'd use it as follows:
///
///      loop(times: 5) {
///          print("Hello world")
///      }
///
///  This is the same as
///
///      var i = 0
///      while i < 5 {
///          print("Hello world")
///          i = i + 1
///      }
/// - Parameters:
///   - times: how many times you want to loop
///   - code: the code that you want to loop over
public func loop(times: Int,_ code: ()->Void) {
    for _ in 0..<times {
        code()
    }
}
