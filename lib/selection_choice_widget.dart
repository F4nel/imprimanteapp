import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/stock_repository.dart';
import 'package:imprimanteapp/stock_repository_widget.dart';


class SelectionChoice extends StatefulWidget {
  const SelectionChoice({super.key});

  @override
  State<SelectionChoice> createState() => _SelectionChoiceState();
}

class _SelectionChoiceState extends State<SelectionChoice> {
  Set<String> _selected = {'id'};
  Widget _currentWidget = ErrorWidget.withDetails(); //A modifier plus tars

  void updateSelection(Set<String> newSelection) {
    setState(() {
      _selected = newSelection;

      final stockRepository = GetIt.instance<StockRepository>();
      final printers = stockRepository.products
          .where((product) => product.type.isNotEmpty)
          .toList();

      // Met à jour le widget actuel en fonction de la sélection
      if (_selected.first == 'id') {
        printers.sort((a,b) => a.id.compareTo(b.id));
        _currentWidget = StockRepositoryWidget(printerSorted: printers,);
      } else if (_selected.first == 'type') {
        printers.sort((a,b) => a.type.compareTo(b.type));
        _currentWidget = StockRepositoryWidget(printerSorted: printers,);
      } else if (_selected.first == 'date') {
        printers.sort((a,b) => a.dateTime.compareTo(b.dateTime));
        _currentWidget = StockRepositoryWidget(printerSorted: printers,);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello World"),
      ),
      body: Column(
        children: [
          SegmentedButton(
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
            child: _currentWidget, // Affiche le widget sélectionné
          ),
        ],
      ),
    );
  }
}
