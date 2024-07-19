import 'package:flutter/material.dart';
import 'package:flutter_application_1/View/ListView.dart';
import 'package:flutter_application_1/ViewModel/ListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IncidenciaViewModel(),
      child: MaterialApp(
        home: IncidenciaListView(),
      ),
    );
  }
}
