import 'package:easy_localization/easy_localization.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  Utils._private();

  static final _instance = Utils._private();

  factory Utils() {
    return _instance;
  }
  Future<String> getTempDir() async {
    final dir = await getTemporaryDirectory();
    return dir.path;
  }
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
  static String formatDayAndMonth(DateTime date) {
    return DateFormat('MMM dd').format(date);
  }
}
