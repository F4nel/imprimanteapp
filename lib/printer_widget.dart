import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';

class PrinterWidget extends StatelessWidget {
  final Printer printer;
  const PrinterWidget({super.key, required this.printer});

  @override
  Widget build ( BuildContext context ) {
    return Padding (
        padding : const EdgeInsets.all(8.0),
        child: Row (
          children: [
            Expanded(
                child: FittedBox(
            child: getImages("${printer.type}")),
        ),
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

  Widget getImages(String types) {
    if (types == "Powder printer") {
      return Image(image: AssetImage('images/powder-printer.png'), fit: BoxFit.cover,);
    }
    if (types == "Wire printer") {
      return Image(image: AssetImage('images/wire-printer.png'));
    }
    if (types == "Resin printer") {
      return Image(image: AssetImage('images/resin-printer.png'));
    }
    return Image(image: AssetImage('images/image-not-found.png'));
  }

}