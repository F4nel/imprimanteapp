import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/printer_details_widget.dart';
import 'package:imprimanteapp/stock_repository_widget.dart';

class StockWidget extends StatelessWidget {
  final List<Printer> printers;
  const StockWidget({super.key, required this.printers});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/stock',
      routes: {
        '/stock': (context) => StockRepositoryWidget(printerSorted: printers),
        '/details' : (context) => const PrinterDetailsWidget(),
      },
    );
    throw UnimplementedError();
  }
}