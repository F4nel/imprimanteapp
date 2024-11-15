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

    String dropdownValue = printer.type;
    final List<String> typesList = ["Powder printer", "Wire printer", "Resin printer"];

    void selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: printer.dateTime, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null) {
        setState(() {
          stockPresenter.setStartDate(printer, picked);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${printer.type} #${printer.id}",
        style: const TextStyle(fontSize: 25.0),),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Type',
                filled: true,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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

            const SizedBox(height: 30,),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Id',
                filled: true,
              ),
              initialValue: "${printer.id}",
              onChanged: (text) {
                int? newId = int.tryParse(text);
                if (newId != null) {
                  stockPresenter.setId(printer, newId);
                }
              },
            ),
            const SizedBox(height: 30,),
            Material(
              elevation:10,
              child: InputDecorator(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.deepPurple,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.deepPurple,
                    backgroundColor: Color(0xFFF3E5F5),
                  ),
                  labelText: 'Start date',
                  border: OutlineInputBorder(),
                ),
                child:
                Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex :5,
                        child: Text("${printer.dateTime.day}/${printer.dateTime.month}/${printer.dateTime.year}")
                    ),
                    Flexible(
                        flex: 1,
                        child: IconButton(
                            focusColor: Colors.grey,
                            onPressed: () => selectDate(context),
                            icon: const Icon(Icons.calendar_month))
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30,),

            Padding(padding: const EdgeInsets.only(left: 160.0),
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
              ),
              onPressed: () => stockPresenter.scheduleMaintenance(printer),
              child: const Text(
                'Schedule Maintenance',
                style: TextStyle(color: Colors.white),)
              ,),)
          ],
        ),
      ),
    );
  }
}