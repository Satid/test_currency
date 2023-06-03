import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_currency/models/currency_list_model.dart';

import '../models/currency_model.dart';
import '../repositories/currency/currency_repository.dart';

class CurrencyViewModel {
  final String title = "Currency Update";
  CurrencyRepository? currencyRepository;

  CurrencyViewModel({this.currencyRepository});

  Future<CurrencyModel> fetchAll() async {
    CurrencyModel list = await currencyRepository!.getAllCurrency();
    return list;
  }

  Future<void> createFile(String content) async {
    Directory dir = await getTemporaryDirectory();
    File file = File("${dir.path}/currencyHistory.json");
    file.createSync();
    file.writeAsStringSync(content);
  }

  Future<void> writeJsonFile() async {
    CurrencyModel currencyModel = await currencyRepository!.getAllCurrency();
    List<CurrencyModel> historyListModel = <CurrencyModel>[];

    Directory dir = await getTemporaryDirectory();
    File filePath = File("${dir.path}/currencyHistory.json");
    bool fileExists = filePath.existsSync();
    if (fileExists) {
      String jsonData = filePath.readAsStringSync();
      var map = jsonDecode(jsonData) as List;
      historyListModel = (map)
          .map((i) => CurrencyModel.fromJson(i))
          .toList();
    } else {
      print('File Not Found');
    }

    if (currencyModel != null) {
      historyListModel.add(currencyModel);
      String jsonForWrite = jsonEncode(historyListModel);
      createFile(jsonForWrite);
    } else {
      print('Request failed with status:');
    }
  }


}
