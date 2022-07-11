import 'package:alura_studies/models/transfer.dart';
import 'package:flutter/material.dart';

class CardWithMonetizationIcon extends StatelessWidget {
  final Transfer transfer;

  const CardWithMonetizationIcon({
    Key? key,
    required this.transfer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transfer.value.toString()),
        subtitle: Text(transfer.accountNumber.toString()),
      ),
    );
  }
}
