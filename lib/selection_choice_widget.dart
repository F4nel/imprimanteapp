import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imprimanteapp/stock_widget.dart';

class SelectionChoice extends StatefulWidget {
  const SelectionChoice({super.key});

  @override
  State<SelectionChoice> createState() => _SelectionChoiceState();
}

class _SelectionChoiceState extends State<SelectionChoice> {
  Set<String> _selected = {'id'};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton (
      segments: const <ButtonSegment> [
        ButtonSegment(
            value: 'id',
            label: Text('id')),
        ButtonSegment(
            value: 'type',
            label: Text('type')),
        ButtonSegment(
            value: 'date',
            label: Text('date')),
      ],
      selected: _selected,
    );
    throw UnimplementedError();
  }
}