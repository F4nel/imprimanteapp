import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/printer_widget.dart';
import 'package:imprimanteapp/stock_repository.dart';

class StockWidget extends StatelessWidget {
  const StockWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    bool sortById = true;
    bool sortByType = false;
    bool sortByDate = false;
    final stockRepository = GetIt.instance<StockRepository>();
    final printers = stockRepository.products
        .where((product) => product.type.isNotEmpty)
        .toList();
    
    return Scaffold(
      appBar: AppBar(title: const Text("3D Printers"),),
      body: Column(children: [
        const SizedBox(height: 16),
        Expanded(
            child: ListView.builder(
                itemCount: printers.length,
                itemBuilder : (BuildContext context, int index) {
                  return PrinterWidget(printer: printers[index]);
                }))
      ]));
  }
}