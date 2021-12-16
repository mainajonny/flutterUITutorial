import "dart:core";

class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom);
}

List<CardModel> Map<cardData>(List list, Function handler) {
  List<CardModel> result = [];

  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

List<CardModel> cards = cardData
    .map((e) => CardModel(
        e['user'] as String,
        e['cardNumber'] as String,
        e['cardExpired'] as String,
        e['cardType'] as String,
        e['cardBackground'] as int,
        e['cardElementTop'] as String,
        e['cardElementBottom'] as String))
    .toList();

var cardData = [
  {
    "user": "John Kabura",
    "cardNumber": "**** **** **** 5978",
    "cardExpired": "05/25",
    "cardType": "assets/images/visa_logo.png",
    "cardBackground": 0xFF000000,
    "cardElementTop": "assets/svg/ellipseTop.svg",
    "cardElementBottom": "assets/svg/ellipseBottom.svg"
  },
  {
    "user": "Esther Shiko",
    "cardNumber": "**** **** **** 1995",
    "cardExpired": "02/24",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF0D47A1,
    "cardElementTop": "assets/svg/ellipseTop_2.svg",
    "cardElementBottom": "assets/svg/ellipseBottom.svg"
  },
  {
    "user": "Lione Alushula",
    "cardNumber": "**** **** **** 8215",
    "cardExpired": "03/22",
    "cardType": "assets/images/visa_logo.png",
    "cardBackground": 0xFF3E2723,
    "cardElementTop": "assets/svg/ellipseTop.svg",
    "cardElementBottom": "assets/svg/ellipseBottom_2.svg"
  }
];
