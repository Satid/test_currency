import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/currency_model.dart';
import '../repositories/currency/currency_repository.dart';

class CurrencyViewModel {
  final String title = "All Posts";
  CurrencyRepository? currencyRepository;
  CurrencyViewModel({this.currencyRepository});

  Future<CurrencyModel> fetchAllPosts() async {
    CurrencyModel list = await currencyRepository!.getAllPosts();
    return list;
  }
}
