import 'package:alura_studies/components/card_with_monetization_icon.dart';
import 'package:alura_studies/models/transfer.dart';
import 'package:alura_studies/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';

class TransferList extends StatefulWidget {
  TransferList({Key? key}) : super(key: key);

  final transfers = <Transfer>[];

  @override
  createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTransferToList(context),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: widget.transfers.length,
        itemBuilder: (BuildContext context, int index) {
          final transfer = widget.transfers[index];
          return CardWithMonetizationIcon(transfer: transfer);
        },
      ),
    );
  }

  addNewTransferToList(BuildContext context) async {
    final Transfer? receivedTransfer = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TransferForm(),
      ),
    );
    setState(() {
      if (receivedTransfer != null) {
        widget.transfers.add(receivedTransfer);
      }
    });
  }
}
