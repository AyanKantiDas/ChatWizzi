import 'package:flutter/material.dart';

class MyDateUtil {
  static String getFormattedTime(
      {required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final timeOfDay = TimeOfDay.fromDateTime(date);

    String formattedTime = timeOfDay.format(context);

    return '$formattedTime ';
  }

  static String getLastMessageTime(
      {required BuildContext context,
      required String time,
      bool showYear = false}) {
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final DateTime now = DateTime.now();
    final int currentYear = DateTime.now().year;

    if (now.day == sent.day &&
        now.month == sent.month &&
        now.year == sent.year) {
      final TimeOfDay timeOfDay = TimeOfDay.fromDateTime(sent);
      // String period = timeOfDay.hour < 12 ? 'AM' : 'PM';
      String formattedTime = timeOfDay.format(context);
      return '$formattedTime ';
    }

    return showYear
        ? '${sent.day} ${_getMonth(sent)} ${currentYear}'
        : '${sent.day} ${_getMonth(sent)}';
  }

  static String _getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return 'NA';
  }

  static String getLastActiveTime(
      {required BuildContext context, required String lastActive}) {
    final int i = int.tryParse(lastActive) ?? -1;

    //if time is not available then return below statement
    if (i == -1) return 'Last seen not available';

    DateTime time = DateTime.fromMillisecondsSinceEpoch(i);
    DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == time.year) {
      return 'Last seen today at $formattedTime';
    }

    if ((now.difference(time).inHours / 24).round() == 1) {
      return 'Last seen yesterday at $formattedTime';
    }

    String month = _getMonth(time);

    return 'Last seen on ${time.day} $month on $formattedTime';
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isYesterday(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day - 1;
  }

  static String getMessageTime(
      {required BuildContext context,
      required String time,
      bool showYear = false}) {
    final DateTime sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    final DateTime now = DateTime.now();
    final int currentYear = DateTime.now().year;

    final formate = TimeOfDay.fromDateTime(sent);
    if (now.year == sent.year &&
        now.month == sent.month &&
        now.day == sent.day) {
      String period = formate.hour < 12 ? 'AM' : 'PM';
      String formattedTime = formate.format(context);
      return '$formattedTime $period';
    }

    return showYear
        ? '$formate-  ${sent.day} ${_getMonth(sent)} ${currentYear}'
        : '$formate- ${sent.day} ${_getMonth(sent)}';
  }
}
