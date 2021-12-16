import "dart:core";

class SplashDataModel {
  String title;
  String text;
  String image;

  SplashDataModel(this.title, this.text, this.image);
}

List<SplashDataModel> Map<splashdata>(List list, Function handler) {
  List<SplashDataModel> result = [];

  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

List<SplashDataModel> splashData = Data.map((e) => SplashDataModel(
    e['title'] as String, e['text'] as String, e['image'] as String)).toList();

var Data = [
  {
    "title": 'Deposit',
    "text": 'Tired of having many apps to view and move your money?',
    "image": 'assets/images/deposit.png'
  },
  {
    "title": 'Withdraw',
    "text":
        'Or maybe you just need a comprehensive transaction history for quick holistic view of your financial health',
    "image": 'assets/images/withdrawal.png'
  },
  {
    "title": 'Payments',
    "text": 'Or even better... you need the easiest way to request for money?',
    "image": 'assets/images/payments.png'
  },
];
