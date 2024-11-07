import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';

class PrinterWidget extends StatelessWidget {
  final Printer printer;
  const PrinterWidget({super.key, required this.printer});

  @override
  Widget build ( BuildContext context ) {
    return InkWell(
      child: Container (
        height: 100,
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(5.0),
        child: Scaffold(
          body: Row (
            children: [
              Flexible(
                flex: 1,
                child: getImages("${printer.type}")
              ),
              Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                        Text(" ${printer.type} #${printer.id} \n ${printer.dateTime.day}/${printer.dateTime.month}/${printer.dateTime.year}",
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: printer);
      },
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