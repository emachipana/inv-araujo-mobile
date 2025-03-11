import 'package:intl/intl.dart';

class Helpers {
  static RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
  );

  static String parseDate(DateTime? date) {
    if (date == null) return "Sin asignar";

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(Duration(days: 1));

    if (date.isAtSameMomentAs(today)) return "Hoy";

    if (date.isAtSameMomentAs(tomorrow)) return "Mañana";

    return DateFormat("d MMM. yyyy", "es").format(date);
  }
}
