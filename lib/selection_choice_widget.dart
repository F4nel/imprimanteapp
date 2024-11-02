import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imprimanteapp/stock_repository.dart';
import 'package:imprimanteapp/stock_repository_impl.dart';
import 'package:imprimanteapp/stock_sort_by_date_widget.dart';
import 'package:imprimanteapp/stock_sort_by_id_widget.dart';
import 'package:imprimanteapp/stock_sort_by_type_widget.dart';


class SelectionChoice extends StatefulWidget {
  const SelectionChoice({super.key});

  @override
  State<SelectionChoice> createState() => _SelectionChoiceState();
}

class _SelectionChoiceState extends State<SelectionChoice> {
  Set<String> _selected = {'id'};
  Widget _currentWidget = const StockSortByIdWidget();

  void updateSelection(Set<String> newSelection) {
    setState(() {
      _selected = newSelection;

      // Met à jour le widget actuel en fonction de la sélection
      if (_selected.first == 'id') {
        _currentWidget = const StockSortByIdWidget();
      } else if (_selected.first == 'type') {
        _currentWidget = const StockSortByTypeWidget();
      } else if (_selected.first == 'date') {
        _currentWidget = const StockSortByDateWidget();
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
