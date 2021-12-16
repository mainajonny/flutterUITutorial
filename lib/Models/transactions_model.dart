// To parse this JSON data, do
//
//     final transactionsModel = transactionsModelFromJson(jsonString);

import 'dart:convert';

TransactionsModel transactionsModelFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsModelToJson(TransactionsModel data) =>
    json.encode(data.toJson());

class TransactionsModel {
  TransactionsModel({
    required this.id,
    required this.accountNo,
    required this.depositType,
    required this.clientId,
    required this.clientName,
    required this.savingsProductId,
    required this.savingsProductName,
    required this.fieldOfficerId,
    required this.status,
    required this.subStatus,
    required this.timeline,
    required this.currency,
    required this.nominalAnnualInterestRate,
    required this.interestCompoundingPeriodType,
    required this.interestPostingPeriodType,
    required this.interestCalculationType,
    required this.interestCalculationDaysInYearType,
    required this.withdrawalFeeForTransfers,
    required this.allowOverdraft,
    required this.enforceMinRequiredBalance,
    required this.withHoldTax,
    required this.lastActiveTransactionDate,
    required this.isDormancyTrackingActive,
    required this.summary,
    required this.transactions,
  });

  int id;
  String accountNo;
  Type depositType;
  int clientId;
  String clientName;
  int savingsProductId;
  String savingsProductName;
  int fieldOfficerId;
  Status status;
  SubStatus subStatus;
  Timeline timeline;
  Currency currency;
  double nominalAnnualInterestRate;
  Type interestCompoundingPeriodType;
  Type interestPostingPeriodType;
  Type interestCalculationType;
  Type interestCalculationDaysInYearType;
  bool withdrawalFeeForTransfers;
  bool allowOverdraft;
  bool enforceMinRequiredBalance;
  bool withHoldTax;
  List<int> lastActiveTransactionDate;
  bool isDormancyTrackingActive;
  Summary summary;
  List<Transaction> transactions;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        id: json["id"],
        accountNo: json["accountNo"],
        depositType: Type.fromJson(json["depositType"]),
        clientId: json["clientId"],
        clientName: json["clientName"],
        savingsProductId: json["savingsProductId"],
        savingsProductName: json["savingsProductName"],
        fieldOfficerId: json["fieldOfficerId"],
        status: Status.fromJson(json["status"]),
        subStatus: SubStatus.fromJson(json["subStatus"]),
        timeline: Timeline.fromJson(json["timeline"]),
        currency: Currency.fromJson(json["currency"]),
        nominalAnnualInterestRate: json["nominalAnnualInterestRate"].toDouble(),
        interestCompoundingPeriodType:
            Type.fromJson(json["interestCompoundingPeriodType"]),
        interestPostingPeriodType:
            Type.fromJson(json["interestPostingPeriodType"]),
        interestCalculationType: Type.fromJson(json["interestCalculationType"]),
        interestCalculationDaysInYearType:
            Type.fromJson(json["interestCalculationDaysInYearType"]),
        withdrawalFeeForTransfers: json["withdrawalFeeForTransfers"],
        allowOverdraft: json["allowOverdraft"],
        enforceMinRequiredBalance: json["enforceMinRequiredBalance"],
        withHoldTax: json["withHoldTax"],
        lastActiveTransactionDate:
            List<int>.from(json["lastActiveTransactionDate"].map((x) => x)),
        isDormancyTrackingActive: json["isDormancyTrackingActive"],
        summary: Summary.fromJson(json["summary"]),
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountNo": accountNo,
        "depositType": depositType.toJson(),
        "clientId": clientId,
        "clientName": clientName,
        "savingsProductId": savingsProductId,
        "savingsProductName": savingsProductName,
        "fieldOfficerId": fieldOfficerId,
        "status": status.toJson(),
        "subStatus": subStatus.toJson(),
        "timeline": timeline.toJson(),
        "currency": currency.toJson(),
        "nominalAnnualInterestRate": nominalAnnualInterestRate,
        "interestCompoundingPeriodType": interestCompoundingPeriodType.toJson(),
        "interestPostingPeriodType": interestPostingPeriodType.toJson(),
        "interestCalculationType": interestCalculationType.toJson(),
        "interestCalculationDaysInYearType":
            interestCalculationDaysInYearType.toJson(),
        "withdrawalFeeForTransfers": withdrawalFeeForTransfers,
        "allowOverdraft": allowOverdraft,
        "enforceMinRequiredBalance": enforceMinRequiredBalance,
        "withHoldTax": withHoldTax,
        "lastActiveTransactionDate":
            List<dynamic>.from(lastActiveTransactionDate.map((x) => x)),
        "isDormancyTrackingActive": isDormancyTrackingActive,
        "summary": summary.toJson(),
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
      };
}

class Currency {
  Currency({
    required this.code,
    required this.name,
    required this.decimalPlaces,
    required this.inMultiplesOf,
    required this.displaySymbol,
    required this.nameCode,
    required this.displayLabel,
  });

  String code;
  String name;
  int decimalPlaces;
  int inMultiplesOf;
  String displaySymbol;
  String nameCode;
  String displayLabel;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        decimalPlaces: json["decimalPlaces"],
        inMultiplesOf: json["inMultiplesOf"],
        displaySymbol: json["displaySymbol"],
        nameCode: json["nameCode"],
        displayLabel: json["displayLabel"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "decimalPlaces": decimalPlaces,
        "inMultiplesOf": inMultiplesOf,
        "displaySymbol": displaySymbol,
        "nameCode": nameCode,
        "displayLabel": displayLabel,
      };
}

class Type {
  Type({
    required this.id,
    required this.code,
    required this.value,
  });

  int id;
  String code;
  String value;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        code: json["code"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
      };
}

class Status {
  Status({
    required this.id,
    required this.code,
    required this.value,
    required this.submittedAndPendingApproval,
    required this.approved,
    required this.rejected,
    required this.withdrawnByApplicant,
    required this.active,
    required this.closed,
    required this.prematureClosed,
    required this.transferInProgress,
    required this.transferOnHold,
    required this.matured,
  });

  int id;
  String code;
  String value;
  bool submittedAndPendingApproval;
  bool approved;
  bool rejected;
  bool withdrawnByApplicant;
  bool active;
  bool closed;
  bool prematureClosed;
  bool transferInProgress;
  bool transferOnHold;
  bool matured;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        submittedAndPendingApproval: json["submittedAndPendingApproval"],
        approved: json["approved"],
        rejected: json["rejected"],
        withdrawnByApplicant: json["withdrawnByApplicant"],
        active: json["active"],
        closed: json["closed"],
        prematureClosed: json["prematureClosed"],
        transferInProgress: json["transferInProgress"],
        transferOnHold: json["transferOnHold"],
        matured: json["matured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "submittedAndPendingApproval": submittedAndPendingApproval,
        "approved": approved,
        "rejected": rejected,
        "withdrawnByApplicant": withdrawnByApplicant,
        "active": active,
        "closed": closed,
        "prematureClosed": prematureClosed,
        "transferInProgress": transferInProgress,
        "transferOnHold": transferOnHold,
        "matured": matured,
      };
}

class SubStatus {
  SubStatus({
    required this.id,
    required this.code,
    required this.value,
    required this.none,
    required this.inactive,
    required this.dormant,
    required this.escheat,
    required this.block,
    required this.blockCredit,
    required this.blockDebit,
  });

  int id;
  String code;
  String value;
  bool none;
  bool inactive;
  bool dormant;
  bool escheat;
  bool block;
  bool blockCredit;
  bool blockDebit;

  factory SubStatus.fromJson(Map<String, dynamic> json) => SubStatus(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        none: json["none"],
        inactive: json["inactive"],
        dormant: json["dormant"],
        escheat: json["escheat"],
        block: json["block"],
        blockCredit: json["blockCredit"],
        blockDebit: json["blockDebit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "none": none,
        "inactive": inactive,
        "dormant": dormant,
        "escheat": escheat,
        "block": block,
        "blockCredit": blockCredit,
        "blockDebit": blockDebit,
      };
}

class Summary {
  Summary({
    required this.currency,
    required this.totalDeposits,
    required this.totalWithdrawals,
    required this.totalInterestEarned,
    required this.totalInterestPosted,
    required this.accountBalance,
    required this.totalOverdraftInterestDerived,
    required this.interestNotPosted,
    required this.lastInterestCalculationDate,
    required this.availableBalance,
  });

  Currency currency;
  int totalDeposits;
  int totalWithdrawals;
  double totalInterestEarned;
  int totalInterestPosted;
  int accountBalance;
  int totalOverdraftInterestDerived;
  double interestNotPosted;
  List<int> lastInterestCalculationDate;
  int availableBalance;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        currency: Currency.fromJson(json["currency"]),
        totalDeposits: json["totalDeposits"],
        totalWithdrawals: json["totalWithdrawals"],
        totalInterestEarned: json["totalInterestEarned"].toDouble(),
        totalInterestPosted: json["totalInterestPosted"],
        accountBalance: json["accountBalance"],
        totalOverdraftInterestDerived: json["totalOverdraftInterestDerived"],
        interestNotPosted: json["interestNotPosted"].toDouble(),
        lastInterestCalculationDate:
            List<int>.from(json["lastInterestCalculationDate"].map((x) => x)),
        availableBalance: json["availableBalance"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency.toJson(),
        "totalDeposits": totalDeposits,
        "totalWithdrawals": totalWithdrawals,
        "totalInterestEarned": totalInterestEarned,
        "totalInterestPosted": totalInterestPosted,
        "accountBalance": accountBalance,
        "totalOverdraftInterestDerived": totalOverdraftInterestDerived,
        "interestNotPosted": interestNotPosted,
        "lastInterestCalculationDate":
            List<dynamic>.from(lastInterestCalculationDate.map((x) => x)),
        "availableBalance": availableBalance,
      };
}

class Timeline {
  Timeline({
    required this.submittedOnDate,
    required this.submittedByUsername,
    required this.submittedByFirstname,
    required this.submittedByLastname,
    required this.approvedOnDate,
    required this.approvedByUsername,
    required this.approvedByFirstname,
    required this.approvedByLastname,
    required this.activatedOnDate,
    required this.activatedByUsername,
    required this.activatedByFirstname,
    required this.activatedByLastname,
  });

  List<int> submittedOnDate;
  String submittedByUsername;
  String submittedByFirstname;
  String submittedByLastname;
  List<int> approvedOnDate;
  String approvedByUsername;
  String approvedByFirstname;
  String approvedByLastname;
  List<int> activatedOnDate;
  String activatedByUsername;
  String activatedByFirstname;
  String activatedByLastname;

  factory Timeline.fromJson(Map<String, dynamic> json) => Timeline(
        submittedOnDate: List<int>.from(json["submittedOnDate"].map((x) => x)),
        submittedByUsername: json["submittedByUsername"],
        submittedByFirstname: json["submittedByFirstname"],
        submittedByLastname: json["submittedByLastname"],
        approvedOnDate: List<int>.from(json["approvedOnDate"].map((x) => x)),
        approvedByUsername: json["approvedByUsername"],
        approvedByFirstname: json["approvedByFirstname"],
        approvedByLastname: json["approvedByLastname"],
        activatedOnDate: List<int>.from(json["activatedOnDate"].map((x) => x)),
        activatedByUsername: json["activatedByUsername"],
        activatedByFirstname: json["activatedByFirstname"],
        activatedByLastname: json["activatedByLastname"],
      );

  Map<String, dynamic> toJson() => {
        "submittedOnDate": List<dynamic>.from(submittedOnDate.map((x) => x)),
        "submittedByUsername": submittedByUsername,
        "submittedByFirstname": submittedByFirstname,
        "submittedByLastname": submittedByLastname,
        "approvedOnDate": List<dynamic>.from(approvedOnDate.map((x) => x)),
        "approvedByUsername": approvedByUsername,
        "approvedByFirstname": approvedByFirstname,
        "approvedByLastname": approvedByLastname,
        "activatedOnDate": List<dynamic>.from(activatedOnDate.map((x) => x)),
        "activatedByUsername": activatedByUsername,
        "activatedByFirstname": activatedByFirstname,
        "activatedByLastname": activatedByLastname,
      };
}

class Transaction {
  Transaction({
    required this.id,
    required this.transactionType,
    required this.accountId,
    required this.accountNo,
    required this.date,
    required this.currency,
    required this.amount,
    required this.runningBalance,
    required this.reversed,
    required this.transfer,
    required this.submittedOnDate,
    required this.interestedPostedAsOn,
    required this.submittedByUsername,
    required this.paymentDetailData,
  });

  int id;
  TransactionType transactionType;
  int accountId;
  String accountNo;
  List<int> date;
  Currency currency;
  int amount;
  int runningBalance;
  bool reversed;
  Transfer transfer;
  List<int> submittedOnDate;
  bool interestedPostedAsOn;
  String submittedByUsername;
  PaymentDetailData paymentDetailData;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        transactionType: TransactionType.fromJson(json["transactionType"]),
        accountId: json["accountId"],
        accountNo: json["accountNo"],
        date: List<int>.from(json["date"].map((x) => x)),
        currency: Currency.fromJson(json["currency"]),
        amount: json["amount"],
        runningBalance: json["runningBalance"],
        reversed: json["reversed"],
        //transfer: json["transfer"] == null ? null : Transfer.fromJson(json["transfer"]),
        transfer: json["transfer"] = Transfer.fromJson(json["transfer"]),
        submittedOnDate: List<int>.from(json["submittedOnDate"].map((x) => x)),
        interestedPostedAsOn: json["interestedPostedAsOn"],
        submittedByUsername: json["submittedByUsername"],
        //paymentDetailData: json["paymentDetailData"] == null ? null : PaymentDetailData.fromJson(json["paymentDetailData"]),
        paymentDetailData: json["paymentDetailData"] =
            PaymentDetailData.fromJson(json["paymentDetailData"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transactionType": transactionType.toJson(),
        "accountId": accountId,
        "accountNo": accountNo,
        "date": List<dynamic>.from(date.map((x) => x)),
        "currency": currency.toJson(),
        "amount": amount,
        "runningBalance": runningBalance,
        "reversed": reversed,
        "transfer": transfer == null ? null : transfer.toJson(),
        "submittedOnDate": List<dynamic>.from(submittedOnDate.map((x) => x)),
        "interestedPostedAsOn": interestedPostedAsOn,
        "submittedByUsername": submittedByUsername,
        "paymentDetailData":
            paymentDetailData == null ? null : paymentDetailData.toJson(),
      };
}

class PaymentDetailData {
  PaymentDetailData({
    required this.id,
    required this.paymentType,
    required this.accountNumber,
    required this.checkNumber,
    required this.routingCode,
    required this.receiptNumber,
    required this.bankNumber,
  });

  int id;
  PaymentType paymentType;
  String accountNumber;
  String checkNumber;
  String routingCode;
  String receiptNumber;
  String bankNumber;

  factory PaymentDetailData.fromJson(Map<String, dynamic> json) =>
      PaymentDetailData(
        id: json["id"],
        paymentType: PaymentType.fromJson(json["paymentType"]),
        accountNumber: json["accountNumber"],
        checkNumber: json["checkNumber"],
        routingCode: json["routingCode"],
        receiptNumber: json["receiptNumber"],
        bankNumber: json["bankNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "paymentType": paymentType.toJson(),
        "accountNumber": accountNumber,
        "checkNumber": checkNumber,
        "routingCode": routingCode,
        "receiptNumber": receiptNumber,
        "bankNumber": bankNumber,
      };
}

class PaymentType {
  PaymentType({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class TransactionType {
  TransactionType({
    required this.id,
    required this.code,
    required this.value,
    required this.deposit,
    required this.dividendPayout,
    required this.withdrawal,
    required this.interestPosting,
    required this.feeDeduction,
    required this.initiateTransfer,
    required this.approveTransfer,
    required this.withdrawTransfer,
    required this.rejectTransfer,
    required this.overdraftInterest,
    required this.writtenoff,
    required this.overdraftFee,
    required this.withholdTax,
    required this.escheat,
    required this.amountHold,
    required this.amountRelease,
  });

  int id;
  String code;
  String value;
  bool deposit;
  bool dividendPayout;
  bool withdrawal;
  bool interestPosting;
  bool feeDeduction;
  bool initiateTransfer;
  bool approveTransfer;
  bool withdrawTransfer;
  bool rejectTransfer;
  bool overdraftInterest;
  bool writtenoff;
  bool overdraftFee;
  bool withholdTax;
  bool escheat;
  bool amountHold;
  bool amountRelease;

  factory TransactionType.fromJson(Map<String, dynamic> json) =>
      TransactionType(
        id: json["id"],
        code: json["code"],
        value: json["value"],
        deposit: json["deposit"],
        dividendPayout: json["dividendPayout"],
        withdrawal: json["withdrawal"],
        interestPosting: json["interestPosting"],
        feeDeduction: json["feeDeduction"],
        initiateTransfer: json["initiateTransfer"],
        approveTransfer: json["approveTransfer"],
        withdrawTransfer: json["withdrawTransfer"],
        rejectTransfer: json["rejectTransfer"],
        overdraftInterest: json["overdraftInterest"],
        writtenoff: json["writtenoff"],
        overdraftFee: json["overdraftFee"],
        withholdTax: json["withholdTax"],
        escheat: json["escheat"],
        amountHold: json["amountHold"],
        amountRelease: json["amountRelease"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "value": value,
        "deposit": deposit,
        "dividendPayout": dividendPayout,
        "withdrawal": withdrawal,
        "interestPosting": interestPosting,
        "feeDeduction": feeDeduction,
        "initiateTransfer": initiateTransfer,
        "approveTransfer": approveTransfer,
        "withdrawTransfer": withdrawTransfer,
        "rejectTransfer": rejectTransfer,
        "overdraftInterest": overdraftInterest,
        "writtenoff": writtenoff,
        "overdraftFee": overdraftFee,
        "withholdTax": withholdTax,
        "escheat": escheat,
        "amountHold": amountHold,
        "amountRelease": amountRelease,
      };
}

class Transfer {
  Transfer({
    required this.id,
    required this.reversed,
    required this.currency,
    required this.transferAmount,
    required this.transferDate,
    required this.transferDescription,
  });

  int id;
  bool reversed;
  Currency currency;
  int transferAmount;
  List<int> transferDate;
  String transferDescription;

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        id: json["id"],
        reversed: json["reversed"],
        currency: Currency.fromJson(json["currency"]),
        transferAmount: json["transferAmount"],
        transferDate: List<int>.from(json["transferDate"].map((x) => x)),
        transferDescription: json["transferDescription"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reversed": reversed,
        "currency": currency.toJson(),
        "transferAmount": transferAmount,
        "transferDate": List<dynamic>.from(transferDate.map((x) => x)),
        "transferDescription": transferDescription,
      };
}
