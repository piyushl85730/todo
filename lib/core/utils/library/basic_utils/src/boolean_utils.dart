///
/// Utility library to provide helper methods for Dart boolean.
///
class BooleanUtils {
  /// The false String "false"
  //ignore:constant_identifier_names
  static const String FALSE = "false";

  /// The true String "true"
  //ignore:constant_identifier_names
  static const String TRUE = "true";

  /// Performs an 'and' operation on a set of booleans.
  ///
  /// Example
  ///   BooleanUtils.and([true, true])         = true
  ///   BooleanUtils.and([false, false])       = false
  ///   BooleanUtils.and([true, false])        = false
  ///   BooleanUtils.and([true, true, false])  = false
  ///   BooleanUtils.and([true, true, true])   = true
  static bool and(final List<bool> array) {
    for (final bool element in array) {
      if (!element) {
        return false;
      }
    }
    return true;
  }

  /// Performs an 'or' operation on a set of booleans.
  ///
  ///   BooleanUtils.or(true, true)          = true
  ///   BooleanUtils.or(false, false)        = false
  ///   BooleanUtils.or(true, false)         = true
  ///   BooleanUtils.or(true, true, false)   = true
  ///   BooleanUtils.or(true, true, true)    = true
  ///   BooleanUtils.or(false, false, false) = false
  static bool or(final List<bool> array) {
    for (final bool element in array) {
      if (element) {
        return true;
      }
    }
    return false;
  }

  /// Performs an xor on a set of booleans.
  ///
  ///   BooleanUtils.xor([true, true])   = false
  ///   BooleanUtils.xor([false, false]) = false
  ///   BooleanUtils.xor([true, false])  = true
  static bool xor(final List<bool> array) {
    // false if the neutral element of the xor operator
    bool result = false;
    for (final bool element in array) {
      result ^= element;
    }

    return result;
  }

  /// Returns a new list of possible values (like an enum would).
  static List<bool> booleanValues() => <bool>[false, true];

  /// Compares two boolean values
  static int compare(final bool x, final bool y) {
    if (x == y) {
      return 0;
    }
    return x ? 1 : -1;
  }

  /// Converts an int to a boolean using the convention that zero
  /// is false, everything else is true.
  ///
  ///   BooleanUtils.toBoolean(0) = false
  ///   BooleanUtils.toBoolean(1) = true
  ///   BooleanUtils.toBoolean(2) = true
  static bool toBoolean(final int value) => value != 0;

  /// Converts a String to a Boolean.
  ///
  /// 'true', 'on', 'y', 't', 'yes'
  /// or '1' (case insensitive) will return true.
  /// 'false', 'off', 'n', 'f', 'no'
  /// or '0' (case insensitive) will return false.
  /// Otherwise, null is returned.
  ///
  /// NOTE: This method may return null and may throw a NullPointerException
  /// if unboxed to a boolean
  ///
  ///   // N.B. case is not significant
  ///   BooleanUtils.toBooleanObject(null)    = null
  ///   BooleanUtils.toBooleanObject("true")  = true
  ///   BooleanUtils.toBooleanObject("T")     = true
  ///   BooleanUtils.toBooleanObject("false") = false
  ///   BooleanUtils.toBooleanObject("f")     = false
  ///   BooleanUtils.toBooleanObject("No")    = false
  ///   BooleanUtils.toBooleanObject("n")     = false
  ///   BooleanUtils.toBooleanObject("on")    = true
  ///   BooleanUtils.toBooleanObject("ON")    = true
  ///   BooleanUtils.toBooleanObject("off")   = false
  ///   BooleanUtils.toBooleanObject("oFf")   = false
  ///   BooleanUtils.toBooleanObject("yes")   = true
  ///   BooleanUtils.toBooleanObject("Y")     = true
  ///   BooleanUtils.toBooleanObject("1")     = true
  ///   BooleanUtils.toBooleanObject("0")     = false
  ///   BooleanUtils.toBooleanObject("blue")  = null
  ///   BooleanUtils.toBooleanObject("true ") = null // trailing space (too long)
  ///   BooleanUtils.toBooleanObject("ono")   = null // does not match on or no
  static bool toBooleanObject(final String? str) {
    if (str == TRUE) {
      return true;
    }
    if (str == FALSE) {
      return false;
    }
    if (str == null) {
      return false;
    }
    switch (str.length) {
      case 1:
        {
          final String ch0 = str[0];
          if (ch0 == "y" ||
              ch0 == "Y" ||
              ch0 == "t" ||
              ch0 == "T" ||
              ch0 == "1") {
            return true;
          }
          if (ch0 == "n" ||
              ch0 == "N" ||
              ch0 == "f" ||
              ch0 == "F" ||
              ch0 == "0") {
            return false;
          }
          break;
        }
      case 2:
        {
          final String ch0 = str[0];
          final String ch1 = str[1];
          if ((ch0 == "o" || ch0 == "O") && (ch1 == "n" || ch1 == "N")) {
            return true;
          }
          if ((ch0 == "n" || ch0 == "N") && (ch1 == "o" || ch1 == "O")) {
            return false;
          }
          break;
        }
      case 3:
        {
          final String ch0 = str[0];
          final String ch1 = str[1];
          final String ch2 = str[2];
          if ((ch0 == "y" || ch0 == "Y") &&
              (ch1 == "e" || ch1 == "E") &&
              (ch2 == "s" || ch2 == "S")) {
            return true;
          }
          if ((ch0 == "o" || ch0 == "O") &&
              (ch1 == "f" || ch1 == "F") &&
              (ch2 == "f" || ch2 == "F")) {
            return false;
          }
          break;
        }
      case 4:
        {
          final String ch0 = str[0];
          final String ch1 = str[1];
          final String ch2 = str[2];
          final String ch3 = str[3];
          if ((ch0 == "t" || ch0 == "T") &&
              (ch1 == "r" || ch1 == "R") &&
              (ch2 == "u" || ch2 == "U") &&
              (ch3 == "e" || ch3 == "E")) {
            return true;
          }
          break;
        }
      case 5:
        {
          final String ch0 = str[0];
          final String ch1 = str[1];
          final String ch2 = str[2];
          final String ch3 = str[3];
          final String ch4 = str[4];
          if ((ch0 == "f" || ch0 == "F") &&
              (ch1 == "a" || ch1 == "A") &&
              (ch2 == "l" || ch2 == "L") &&
              (ch3 == "s" || ch3 == "S") &&
              (ch4 == "e" || ch4 == "E")) {
            return false;
          }
          break;
        }
      default:
        break;
    }

    return false;
  }

  /// Converts a Boolean to a boolean handling null.
  ///
  ///   BooleanUtils.toBooleanDefaultIfNull(true, false)  = true
  ///   BooleanUtils.toBooleanDefaultIfNull(true, true)   = true
  ///   BooleanUtils.toBooleanDefaultIfNull(false, true)  = false
  ///   BooleanUtils.toBooleanDefaultIfNull(false, false) = false
  ///   BooleanUtils.toBooleanDefaultIfNull(null, true)           = true
  ///   BooleanUtils.toBooleanDefaultIfNull(null, false)          = false
  static bool toBooleanDefaultIfNull(
    final bool? value,
    final bool valueIfNull,
  ) {
    if (value == null) {
      return valueIfNull;
    }
    return value;
  }

  /// Converts a boolean to an int using the convention that
  /// true is 1 and false is 0
  ///
  ///   BooleanUtils.toInteger(true)  = 1
  ///   BooleanUtils.toInteger(false) = 0
  static int toInteger(final bool bool) => bool ? 1 : 0;

  /// Converts a boolean to a String returning one of the input Strings.
  ///
  ///   BooleanUtils.toBooleanString(true)   = "true"
  ///   BooleanUtils.toBooleanString(false)  = "false"
  static String toBooleanString(final bool value) => value ? TRUE : FALSE;
}
