import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_currency/repositories/currency/currency_repository.dart';

import '../../models/currency_model.dart';

class CurrencyAPI extends CurrencyRepository {

  late final CurrencyModel person;

  @override
  Future<CurrencyModel> getAllPosts() async {

    try {
      var response =
          await Dio().get('https://api.coindesk.com/v1/bpi/currentprice.json');
      //final postsd = currencyModelFromJson(response.data);
      //final Map<String, dynamic> data = json.decode(response.data);
      // var list = response.data as List;
      // posts = list.map((post) => PostModel.fromJson(post)).toList();
      Map<String, dynamic> map = jsonDecode(response.data);
      person = CurrencyModel.fromJson(map);
      var check = "";

    } catch (exception) {
      print(exception);
    }

    return person;
  }
}
