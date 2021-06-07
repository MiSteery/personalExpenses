import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTansaction;


  TransactionList(this.transactions, this.deleteTansaction);
  @override
  @override
  Widget build(BuildContext context) {
    return 
    //Container(
     // height: 300, // if size show problem then resize the size
   // height: MediaQuery.of(context).size.height*0.6,
       transactions.isEmpty
          ? LayoutBuilder(builder: (ctx,constraints){
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction added here',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight*0.6,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
          ) 
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}'))),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    //show the delete text instead of only delete icon if the condition meets
                    trailing: MediaQuery.of(context).size.width > 460 ?
                   FlatButton.icon(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTansaction(transactions[index].id),
                       label: Text('Delete'),
                       textColor: Theme.of(context).errorColor,
                       )
                    : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTansaction(transactions[index].id),
                    ),
                  ),
                );
                //only show the delete icon
                    //  trailing: IconButton(
                    //   icon: Icon(Icons.delete),
                    //   color: Theme.of(context).errorColor,
                    //   onPressed: () => deleteTansaction(transactions[index].id),
                    // ),
                //   ),
                // );
                //up listtile builder is an alternative way of using card
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColor,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}', //tx.amount.toString(),
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Colors.purple,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline1,

                //             //  TextStyle(
                //             //   fontSize: 15,
                //             //   fontWeight: FontWeight.bold,
                //             // ),
                //           ),
                //           Text(
                //             DateFormat.yMMM().format(
                //                 transactions[index].date), //tx.date.toString(),
                //             style: TextStyle(
                //               fontSize: 10,
                //               color: Colors.grey,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,           
    );
  }
}
