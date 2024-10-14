import 'package:flutter/material.dart';

class ImprimanteWidget extends StatelessWidget {
  const ImprimanteWidget ({ super . key }) ;
  @override
  Widget build ( BuildContext context ) {
    return Scaffold (
        appBar : AppBar (
          title : const Text (" Imprimante ") ,
        ) ,
        body : const Padding (
            padding : EdgeInsets . all (16.0) ,
            child : Text (" Welcome to Warehouse !")
        )
    );
  }
}