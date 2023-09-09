import 'package:intl/intl.dart';

class Formatter {
  static final Formatter _instance = Formatter._();

  Formatter._();

  factory Formatter() {
    return _instance;
  }

  String distanceToNow(DateTime date){
    int difference = differenceToNow(date);
    if (difference > 2) {
      return dateToString(date, format: "d MMM yyyy");
    }else if (difference == 2) {
      return "The Day After Tomorrow";
    } else if (difference == 1) {
      return "Tomorrow, ${dateToString(date, format: "HH:mm")}";
    } else if (difference == 0) {
      return dateToString(date, format: "HH:mm");
    } else if (difference == -1) {
      return "Yesterday, ${dateToString(date, format: "HH:mm")}";
    } else if (difference >= -7 && difference < -1) {
      return "Previous ${difference.abs()} days";
    } else if (difference >= -14) {
      return "Last Week";
    }else{
      return dateToString(date, format: "d MMM yyyy");
    }
  }

  int compareToNow(DateTime date, {String format = "yyyy-MM-dd"}) {
    final now = DateTime.now();
    final data = convertFormat(date, format: format);
    final today = convertFormat(now, format: format);
    return data.compareTo(today);
  }

  int differenceToNow(DateTime date, {String format = "yyyy-MM-dd"}) {
    final now = DateTime.now();
    final data = convertFormat(date, format: format);
    final today = convertFormat(now, format: format);
    return data.difference(today).inDays;
  }

  DateTime convertFormat(DateTime date, {String format = "yyyy-MM-dd"}) {
    return stringToDate(dateToString(date, format: format));
  }

  DateTime stringToDate(String time) {
    return DateTime.parse((time));
  }

  String dateToString(DateTime time, {String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(time);
  }
}
