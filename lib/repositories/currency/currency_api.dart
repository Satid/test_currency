import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_currency/repositories/currency/currency_repository.dart';

import '../../models/currency_model.dart';

class CurrencyAPI extends CurrencyRepository {

  late final CurrencyModel currencyModel;

  @override
  Future<CurrencyModel> getAllCurrency() async {

    try {
      var response =
          await Dio().get('https://api.coindesk.com/v1/bpi/currentprice.json');
      Map<String, dynamic> map = jsonDecode(response.data);
      currencyModel = CurrencyModel.fromJson(map);
      var check = "";

    } catch (exception) {
      print(exception);
    }

    return currencyModel;
  }
}
