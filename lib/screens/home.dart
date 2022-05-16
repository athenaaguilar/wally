import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wally/providers/balance.dart';
import 'package:wally/utils/number_format.dart';
import 'package:wally/widgets/appbar.dart';
import 'package:wally/widgets/cash_in_dialog.dart';
import 'package:wally/widgets/send_money_dialog.dart';
import 'package:wally/widgets/warning_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  final String logoUrl = 'assets/images/wally-logo.png';
  final String currency = 'PHP';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateValue = ref.watch(balanceStateProvider);
    final int balance = int.parse(stateValue.toString());
    
    void _showCashInDialog() async {
      await showDialog(
        context: context,
        builder: (_) => CashInDialog(balance: balance),
      );
    }
    void _sendMoneyDialog() async {
      await showDialog(
        context: context,
        builder: (_) => SendMoneyDialog(balance: balance),
      );
    }
    void _insufficientBalanceDialog() async {
      await showDialog(
        context: context,
        builder: (_) => const WarningDialog(message: 'Insufficient Balance'),
      );
    }

    return Scaffold(
      appBar: MainAppBar(
        logoUrl: logoUrl,
        title: title.toUpperCase(),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$currency '),
                  Text(
                    numberFormat(balance),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  IconButton(
                    splashRadius: 22.0,
                    icon: const Icon(Icons.add_circle),
                    color: Colors.blueGrey,
                    onPressed: _showCashInDialog,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: _showCashInDialog,
                  icon: const Icon(Icons.download),
                  label: const Text('Cash in'),
                ),
                TextButton.icon(
                  onPressed: balance > 0 ? _sendMoneyDialog : _insufficientBalanceDialog,
                  icon: const Icon(Icons.upload_rounded),
                  label: const Text('Send money'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}