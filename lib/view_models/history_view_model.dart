import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/currency_model.dart';
import '../repositories/currency/currency_repository.dart';

class HistoryViewModel {
  final String title = "Currency History";

  Future<List<CurrencyModel>> fetchAllHistory() async {
    List<CurrencyModel> list = <CurrencyModel>[];
    Directory dir = await getTemporaryDirectory();
    File filePath = File("${dir.path}/currencyHistory.json");
    bool fileExists = filePath.existsSync();
    if (fileExists) {
      String jsonData = filePath.readAsStringSync();
      var map = jsonDecode(jsonData) as List;
      list = (map)
          .map((i) => CurrencyModel.fromJson(i))
          .toList();
    } else {
      print('File Not Found');
    }
    return
    list;
  }
}
