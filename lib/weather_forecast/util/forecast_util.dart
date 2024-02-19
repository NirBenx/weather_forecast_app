import 'package:intl/intl.dart';

class Util {
  static String appId = "2045e3d63aab735100c9a88867160ef9";
  static String getFormattedDate (DateTime dateTime) {
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}