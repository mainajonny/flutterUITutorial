import "dart:core";

class OperationsModel {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;

  OperationsModel(this.operation, this.selectedIcon, this.unselectedIcon);
}

List<OperationsModel> datas = opData
    .map((e) => OperationsModel(e['operation'] as String,
        e['selectedIcon'] as String, e['unselectedIcon'] as String))
    .toList();

var opData = [
  {
    "operation": "Request\ncash",
    "selectedIcon": "assets/svg/request_white.svg",
    "unselectedIcon": "assets/svg/request_black.svg",
  },
  {
    "operation": "Card\ntransactions",
    "selectedIcon": "assets/svg/card_white.svg",
    "unselectedIcon": "assets/svg/card_black.svg",
  },
  {
    "operation": "My\nguarantors",
    "selectedIcon": "assets/svg/profile_white.svg",
    "unselectedIcon": "assets/svg/profile_black.svg",
  }
];
