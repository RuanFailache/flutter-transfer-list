import 'package:alura_studies/screens/transfer_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alura Studies - Bytebank',
      home: TransferList(),
    );
  }
}
