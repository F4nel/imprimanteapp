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
    final intent = AndroidIntent(
      action: 'android.intent.action.INSERT', // Important
      data: 'content://com.android.calendar/event', // Important
      type: "vnd.android.cursor.dir/event", // Important
      arguments: <String, dynamic>{
        'title': 'Schedule Maintenance for printer ${printer.id}',
        'allDay': true,
        'beginTime': DateTime.now()?.millisecondsSinceEpoch,
        'endTime': DateTime.utc(2030,12,31)?.millisecondsSinceEpoch ??
            DateTime.now().microsecondsSinceEpoch + 3600000 * 2,
        'hasAlarm': 1,
        'calendar_id': 1,
        'eventTimezone': 'Europe/Berlin'
      },
    );

    intent.launchChooser("Choose an App to save the Date");
  }

}