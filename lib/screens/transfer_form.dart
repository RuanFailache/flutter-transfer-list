import 'package:alura_studies/components/editor.dart';
import 'package:alura_studies/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _accountNumController = TextEditingController();

  TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar transferência')),
      body: Column(
        children: [
          Editor(
            controller: _accountNumController,
            label: 'Número da conta',
            hint: '0000',
          ),
          Editor(
            controller: _valueController,
            label: 'Valor',
            hint: '0.0',
          ),
          ElevatedButton(
            onPressed: () => sendFormToTransferList(context),
            child: const Text('Confirmar'),
          )
        ],
      ),
    );
  }

  sendFormToTransferList(BuildContext context) {
    final accountNumber = int.tryParse(_accountNumController.text);
    final value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      final newTransfer = Transfer(accountNumber, value);
      Navigator.of(context).pop(newTransfer);
    }
  }
}
