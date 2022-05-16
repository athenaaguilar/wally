import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: Row(
        children: [
          Expanded(
            child: Text(message ?? 'Action is invalid'),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
