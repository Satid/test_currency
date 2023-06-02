import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/currency_model.dart';
import '../repositories/currency/currency_repository.dart';

class CurrencyViewModel {
  final String title = "Currency";
  CurrencyRepository? currencyRepository;
  CurrencyViewModel({this.currencyRepository});

  Future<CurrencyModel> fetchAll() async {
    CurrencyModel list = await currencyRepository!.getAllPosts();
    return list;
  }

  Future<CurrencyModel> fetchAllById(String bpi) async {
    CurrencyModel list = await currencyRepository!.getAllPosts();
    return list;
  }
}
