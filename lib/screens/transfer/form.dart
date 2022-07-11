import 'package:alura_studies/components/editor.dart';
import 'package:alura_studies/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Criar transferência';
const _accountNumberFieldLabel = 'Número da conta';
const _accountNumberFieldHint = '0000';
const _valueFieldLabel = 'Valor';
const _valueFieldHint = '0.0';
const _confirmButton = 'Confirmar';

class TransferForm extends StatefulWidget {
  final _valueController = TextEditingController();
  final _accountNumController = TextEditingController();

  TransferForm({Key? key}) : super(key: key);

  @override
  createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_appBarTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: widget._accountNumController,
              label: _accountNumberFieldLabel,
              hint: _accountNumberFieldHint,
            ),
            Editor(
              controller: widget._valueController,
              label: _valueFieldLabel,
              hint: _valueFieldHint,
            ),
            ElevatedButton(
              onPressed: () => sendFormToTransferList(context),
              child: const Text(_confirmButton),
            )
          ],
        ),
      ),
    );
  }

  sendFormToTransferList(BuildContext context) {
    final accountNumber = int.tryParse(widget._accountNumController.text);
    final value = double.tryParse(widget._valueController.text);
    if (accountNumber != null && value != null) {
      final newTransfer = Transfer(accountNumber, value);
      Navigator.of(context).pop(newTransfer);
    }
  }
}
