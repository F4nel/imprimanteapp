import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/printer_widget.dart';
import 'package:imprimanteapp/stock_presenter.dart';
import 'package:provider/provider.dart';

class StockRepositoryWidget extends StatefulWidget {
  const StockRepositoryWidget({super.key});

  @override
  State<StatefulWidget> createState() => _StockRepositoryState();
}

class _StockRepositoryState extends State<StockRepositoryWidget>{

  Set<String> _selected = {'id'};


  void updateSelection(Set<String> newSelection) {
    setState(() {
      _selected = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {

    final stockPresenter = context.watch<StockPresenter>();
    List<Printer> printers = stockPresenter.printers;

    // Appliquer le tri en fonction de la sélection
    if (_selected.first == 'id') {
      printers.sort((a, b) => a.id.compareTo(b.id));
    } else if (_selected.first == 'type') {
      printers.sort((a, b) => a.type.compareTo(b.type));
    } else if (_selected.first == 'date') {
      printers.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Printers'),
      ),
      body: Column(children: [
        SegmentedButton(
          expandedInsets: const EdgeInsets.all(15.0),
          multiSelectionEnabled: false,
          segments: const <ButtonSegment<String>>[
            ButtonSegment<String>(
              value: 'id',
              label: Text('id'),
            ),
            ButtonSegment<String>(
              value: 'type',
              label: Text('type'),
            ),
            ButtonSegment<String>(
              value: 'date',
              label: Text('date'),
            ),
          ],
          selected: _selected,
          onSelectionChanged: updateSelection,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: printers.length,
                itemBuilder : (BuildContext context, int index) {
                  return PrinterWidget(printer: printers[index]);
                }))
      ]),
    );
  }

}