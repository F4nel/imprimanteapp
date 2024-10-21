import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/stock_repository.dart';

class StockRepositoryImpl implements StockRepository {

  @override
  List<Printer> products = [
    Printer("Powder", 12, DateTime.utc(14, 10, 2024)),
    Printer("Wire printer", 17, DateTime.utc(10, 10, 2024)),
    Printer("Wire printer", 24, DateTime.utc(11, 10, 2024)),
    Printer("Resin printer", 35, DateTime.utc(05, 02, 2023)),
    Printer("Wire printer", 37, DateTime.utc(20, 07, 2023))
  ];

}