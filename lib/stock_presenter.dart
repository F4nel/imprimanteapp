import 'package:flutter/cupertino.dart';
import 'package:imprimanteapp/printer.dart';

abstract class StockPresenter extends ChangeNotifier {
  abstract List<Printer> printers;

  void setType(Printer printer, String type);
  void setId(Printer printer, int id);
  void setStartDate(Printer printer, DateTime date);
  void scheduleMaintenance(Printer printer);
}