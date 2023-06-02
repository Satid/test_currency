// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  final Time time;
  final String disclaimer;
  final String chartName;
  final Bpi bpi;

  CurrencyModel({
    required this.time,
    required this.disclaimer,
    required this.chartName,
    required this.bpi,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    time: Time.fromJson(json["time"]),
    disclaimer: json["disclaimer"],
    chartName: json["chartName"],
    bpi: Bpi.fromJson(json["bpi"]),
  );

  Map<String, dynamic> toJson() => {
    "time": time.toJson(),
    "disclaimer": disclaimer,
    "chartName": chartName,
    "bpi": bpi.toJson(),
  };
}

class Bpi {
  final Eur usd;
  final Eur gbp;
  final Eur eur;

  Bpi({
    required this.usd,
    required this.gbp,
    required this.eur,
  });

  factory Bpi.fromJson(Map<String, dynamic> json) => Bpi(
    usd: Eur.fromJson(json["USD"]),
    gbp: Eur.fromJson(json["GBP"]),
    eur: Eur.fromJson(json["EUR"]),
  );

  Map<String, dynamic> toJson() => {
    "USD": usd.toJson(),
    "GBP": gbp.toJson(),
    "EUR": eur.toJson(),
  };
}

class Eur {
  final String code;
  final String symbol;
  final String rate;
  final String description;
  final double rateFloat;

  Eur({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory Eur.fromJson(Map<String, dynamic> json) => Eur(
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

class Time {
  final String updated;
  final String updatedIso;
  final String updateduk;

  Time({
    required this.updated,
    required this.updatedIso,
    required this.updateduk,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    updated: json["updated"],
    updatedIso: json["updatedISO"],
    updateduk: json["updateduk"],
  );

  Map<String, dynamic> toJson() => {
    "updated": updated,
    "updatedISO": updatedIso,
    "updateduk": updateduk,
  };
}
