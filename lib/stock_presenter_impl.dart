import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/stock_presenter.dart';
import 'package:imprimanteapp/stock_repository.dart';

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

}