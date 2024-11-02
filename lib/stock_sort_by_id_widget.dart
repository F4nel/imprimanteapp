import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/printer_widget.dart';
import 'package:imprimanteapp/stock_repository.dart';

class StockSortByIdWidget extends StatelessWidget {
  const StockSortByIdWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    final stockRepository = GetIt.instance<StockRepository>();
    final printers = stockRepository.products
        .where((product) => product.type.isNotEmpty)
        .toList();
    printers.sort((a,b) => a.id.compareTo(b.id));

    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          const SizedBox(height: 16),
          Expanded(
              child: ListView.builder(
                  itemCount: printers.length,
                  itemBuilder : (BuildContext context, int index) {
                    return PrinterWidget(printer: printers[index]);
                  }))
        ]),
      ),
    );
  }
}