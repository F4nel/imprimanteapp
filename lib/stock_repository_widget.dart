import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/printer_widget.dart';
import 'package:imprimanteapp/stock_repository.dart';

class StockRepositoryWidget extends StatelessWidget {
  final List<Printer> printerSorted;
  const StockRepositoryWidget({super.key, required this.printerSorted});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          const SizedBox(height: 16),
          Expanded(
              child: ListView.builder(
                  itemCount: printerSorted.length,
                  itemBuilder : (BuildContext context, int index) {
                    return PrinterWidget(printer: printerSorted[index]);
                  }))
        ]),
      ),
    );
  }
}