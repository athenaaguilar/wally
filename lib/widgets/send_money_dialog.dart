import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wally/providers/balance.dart';
import 'package:wally/utils/number_format.dart';

class SendMoneyDialog extends ConsumerWidget {
  SendMoneyDialog({
    Key? key,
    this.balance,
  }) : super(key: key);

  final TextEditingController inputController = TextEditingController();
  final int? balance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: '0.00',
                helperText: 'Available balance is ${numberFormat(balance)}',
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () {
            Navigator.pop(context);
            ref.read(balanceStateProvider.notifier).decrement(int.parse(inputController.text));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Successfully sent PHP ${inputController.text}'),
              ),
            );
          },
        )
      ],
    );
  }
}
