import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {

  @override
  List<Printer> products = [
    Printer("Powder printer", 12, DateTime.utc(2024, 10, 14)),
    Printer("Wire printer", 17, DateTime.utc(2024, 10, 10)),
    Printer("Wire printer", 24, DateTime.utc(2024, 10, 11)),
    Printer("Resin printer", 35, DateTime.utc(2023, 02, 05)),
    Printer("Wire printer", 37, DateTime.utc(2023, 07, 20))
  ];

}