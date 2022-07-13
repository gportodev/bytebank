import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State<TransactionList> {
  final List<Transaction> _transactions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Transferências')),
      ),
      body: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          final transaction = _transactions[index];
          return TransactionItem(transaction);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent[700],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransactionForm();
          })).then((transactionReceived) {
            _atualiza(transactionReceived);
          });
        },
      ),
    );
  }

  void _atualiza(Transaction? transactionReceived) {
    setState(() {
      _transactions.add(transactionReceived!);
    });
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  const TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          hoverColor: Colors.black,
          title: Text("Conta: ${_transaction.accountNumber}",
              style: TextStyle(fontSize: 16)),
          tileColor: Colors.green,
          textColor: Colors.white,
          subtitle: Text("Valor: ${_transaction.value}",
              style: TextStyle(fontSize: 16)),
          leading: Icon(
            Icons.monetization_on_outlined,
            color: Colors.white,
          )),
    );
  }
}
