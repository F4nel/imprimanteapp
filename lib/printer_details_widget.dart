import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/stock_presenter.dart';
import 'package:imprimanteapp/stock_repository.dart';
import 'package:provider/provider.dart';

class PrinterDetailsWidget extends StatefulWidget {
  const PrinterDetailsWidget({super.key});

  @override
  State<PrinterDetailsWidget> createState() => _PrinterDetailsWidget();
}

class _PrinterDetailsWidget extends State<PrinterDetailsWidget> {

  @override
  Widget build(BuildContext context) {
    final printer = ModalRoute.of(context)!.settings.arguments as Printer;
    final stockPresenter = context.watch<StockPresenter>();
    final printers = stockPresenter.printers
        .where((products) => products.type.isNotEmpty)
        .toList();

    String dropdownValue = printer.type;

    List<String> typesList = printers
        .map((product) => product.type) // On extrait uniquement le type
        .where((type) => type.isNotEmpty) // On filtre les types non vides
        .toSet() // Convertit en Set pour éliminer les doublons
        .toList(); // Puis reconvertit en List



    return Scaffold(
      appBar: AppBar(
        title: Text("${printer.type} #${printer.id}"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
                items: typesList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: dropdownValue,
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                    stockPresenter.setType(printer, value);
                  });
                },
              isExpanded: true,
            ),
            TextFormField(
              initialValue: "${printer.id}",
              onChanged: (text) {
                int? newId = int.tryParse(text);
                if (newId != null) {
                  stockPresenter.setId(printer, newId);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}