import 'package:alura_studies/components/card_with_monetization_icon.dart';
import 'package:alura_studies/models/transfer.dart';
import 'package:alura_studies/screens/transfer/form.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';
const _noTransferTitle = 'Nenhuma transação foi efetuada!';
const _noTransferSubtitle = 'Adicione uma nova transação para a sua lista\n'
    'ao clicar no botão no final da tela';

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
        body: widget.transfers.isNotEmpty
            ? ListView.builder(
                itemCount: widget.transfers.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWithMonetizationIcon(
                    transfer: widget.transfers[index],
                  );
                },
              )
            : const EmptyTransferList());
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

class EmptyTransferList extends StatelessWidget {
  const EmptyTransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            _noTransferTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            child: const Text(
              _noTransferSubtitle,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
