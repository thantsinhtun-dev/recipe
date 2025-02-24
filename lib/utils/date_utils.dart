import 'package:easy_localization/easy_localization.dart';

class Utils {
  static List<DateTime> getCurrentWeek(DateTime currentDate) {
    // Get the current date
    List<DateTime> dates = [];
    // Get the first day of the current week (Monday)
    DateTime firstDayOfWeek =
        currentDate.subtract(Duration(days: currentDate.weekday - DateTime.monday));
    for (int i = 0; i < 7; i++) {
      dates.add(firstDayOfWeek.add(Duration(days: i)));
    }
    return dates;
  }

  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
