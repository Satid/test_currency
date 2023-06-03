import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/currency_model.dart';
import '../repositories/currency/currency_repository.dart';

class HistoryViewModel {
  final String title = "Currency History";
  CurrencyRepository? currencyRepository;
  HistoryViewModel({this.currencyRepository});

  Future<List<CurrencyModel>> fetchAllHistory() async {
    //HistoryListModel historyListModel = HistoryListModel();
    List<CurrencyModel> list = <CurrencyModel>[] ;
    list = readJsonFile() as List<CurrencyModel>;
    return list;
  }

  Future<List<CurrencyModel>> readJsonFile() async {
    List<CurrencyModel> list = <CurrencyModel>[] ;
    getTemporaryDirectory().then((Directory directory) {
      Directory dir = directory;
      File filePath = new File(dir.path + "/currencyHistory.json");
      bool fileExists = filePath.existsSync();
      if (fileExists) {
        String jsonData = filePath.readAsStringSync();
        list = jsonDecode(jsonData);
      } else {
        print('File Not Found');
      }
    });
    return list;
  }

}
