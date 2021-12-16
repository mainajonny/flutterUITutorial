import "dart:core";

class TransactionsModel {
  final String name;
  final String date;
  final String amount;
  final String photo;

  TransactionsModel(this.name, this.date, this.amount, this.photo);
}

List<TransactionsModel> transaction = transactionData
    .map((e) => TransactionsModel(e['name'] as String, e['date'] as String,
        e['amount'] as String, e['photo'] as String))
    .toList();

var transactionData = [
  {
    "name": "Mpesa",
    "date": "5th Aug 2021",
    "amount": "Ksh 5,000",
    "photo": "assets/images/ic_mpesa.png"
  },
  {
    "name": "Cash transfer",
    "date": "2nd Aug 2021",
    "amount": "Ksh 1,000",
    "photo": "assets/images/user_image_3.png"
  },
  {
    "name": "Bank transfer",
    "date": "25th Jul 2021",
    "amount": "Ksh 20,000",
    "photo": "assets/images/ic_bank.png"
  },
  {
    "name": "Cash transfer",
    "date": "21st Jul 2021",
    "amount": "Ksh 800",
    "photo": "assets/images/user_image_2.png"
  }
];
