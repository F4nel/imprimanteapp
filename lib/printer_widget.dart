import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';

class PrinterWidget extends StatelessWidget {
  final Printer printer;
  const PrinterWidget({super.key, required this.printer});

  @override
  Widget build ( BuildContext context ) {
    return Padding (
        padding : const EdgeInsets.all(16.0),
        child: Row (
          children: [
            Expanded(
                child: Text("Images")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${printer.type} #${printer.id}"),
                    Text("${printer.dateTime.day}/${printer.dateTime.month}/${printer.dateTime.year}"),
                  ],
                )
          ],
        )
    );
  }
}