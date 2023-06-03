// To parse this JSON data, do
//
//     final currencyListModel = currencyListModelFromJson(jsonString);

import 'dart:convert';

List<CurrencyListModel> currencyListModelFromJson(String str) => List<CurrencyListModel>.from(json.decode(str).map((x) => CurrencyListModel.fromJson(x)));

String currencyListModelToJson(List<CurrencyListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyListModel {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  CurrencyListModel({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory CurrencyListModel.fromJson(Map<String, dynamic> json) => CurrencyListModel(
    code: json["code"],
    symbol: json["symbol"],
    rate: json["rate"],
    description: json["description"],
    rateFloat: json["rate_float"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "symbol": symbol,
    "rate": rate,
    "description": description,
    "rate_float": rateFloat,
  };
}
