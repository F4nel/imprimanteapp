import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:imprimanteapp/printer.dart';
import 'package:imprimanteapp/stock_repository.dart';
import 'package:imprimanteapp/stock_repository_impl.dart';
import 'package:imprimanteapp/stock_sort_by_date_widget.dart';
import 'package:imprimanteapp/stock_sort_by_id_widget.dart';
import 'package:imprimanteapp/selection_choice_widget.dart';
import 'package:imprimanteapp/stock_sort_by_type_widget.dart';

import 'printer_widget.dart';

void main() {
  GetIt.instance.registerSingleton<StockRepository>(StockRepositoryImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20),
          labelLarge: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 20)
        ),
        /*appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary
        )*/
      ),
      home: const SelectionChoice(),
    );
  }
}


