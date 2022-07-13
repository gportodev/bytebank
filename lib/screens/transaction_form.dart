import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Nova transferência";

const _accountLabel = "Número da conta";
const _accountHint = "0000";

const _numberLabel = "Valor";
const _numberHint = "0.00";

const _buttonText = "Confirmar";

class TransactionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionFormStateState();
  }
}

class TransactionFormStateState extends State<TransactionForm> {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _accountNumberController,
                label: _accountLabel,
                hint: _accountHint,
                icon: Icons.onetwothree),
            Editor(
                controller: _valueController,
                label: _numberLabel,
                hint: _numberHint,
                icon: Icons.monetization_on),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.blueAccent[700]),
              ),
              onPressed: () => _createTransaction(context),
              child: Text(_buttonText),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    final accountNumber = int.tryParse(_accountNumberController.text);
    final value = double.tryParse(_valueController.text);

    if (accountNumber != null && value != null) {
      final transactionCreated = Transaction(value, accountNumber);

      Navigator.pop(context, transactionCreated);
    }
  }
}
