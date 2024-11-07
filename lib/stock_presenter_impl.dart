import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/stock_presenter.dart';
import 'package:imprimanteapp/stock_repository.dart';
import 'package:android_intent_plus/android_intent.dart';

class StockPresenterImpl extends StockPresenter {
  @override

  List<Printer> printers= GetIt.instance<StockRepository>().products;

  @override
  void setId(Printer printer, int id) {
    printer.id = id;
    notifyListeners();
  }

  @override
  void setType(Printer printer, String type) {
    printer.type = type;
    notifyListeners();
  }

  @override
  void setStartDate(Printer printer, DateTime date) {
    printer.dateTime = date;
    notifyListeners();
  }

  @override
  void scheduleMaintenance(Printer printer) {
    DateTime now = DateTime.now();
    DateTime nextMonday = now.add(Duration(days: (8 - now.weekday) % 7));

    DateTime startTime = DateTime(nextMonday.year, nextMonday.month, nextMonday.day, 8, 0);
    DateTime endTime = DateTime(nextMonday.year, nextMonday.month, nextMonday.day, 12, 0);

    final intent = AndroidIntent(
      action: 'android.intent.action.INSERT',
      data: 'content://com.android.calendar/events',
      type: "vnd.android.cursor.dir/event",
      arguments: <String, dynamic>{
        'title': 'Powder printer #${printer.id} maintenance',
        'beginTime': startTime.millisecondsSinceEpoch,
        'endTime': endTime.millisecondsSinceEpoch,
        'hasAlarm': 1,
        'calendar_id': 1,
        'eventTimezone': 'Europe/Berlin'
      },
    );

    intent.launchChooser("Choose an App to save the Date");
  }


}