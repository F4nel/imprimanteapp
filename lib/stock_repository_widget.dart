import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/printer_widget.dart';

class StockRepositoryWidget extends StatelessWidget {
  final List<Printer> printerSorted;
  const StockRepositoryWidget({super.key, required this.printerSorted});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
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