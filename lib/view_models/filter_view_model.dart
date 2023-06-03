import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_currency/models/currency_list_model.dart';

import '../models/currency_model.dart';
import '../repositories/currency/currency_repository.dart';

class FilterViewModel {
  final String title = "Calculate Currency to BTC";
  CurrencyRepository? currencyRepository;
  FilterViewModel({this.currencyRepository});

  Future<List<CurrencyListModel>> fetchAllSelect() async {
    CurrencyModel currencyModel = await currencyRepository!.getAllCurrency();
    List<CurrencyListModel> list = <CurrencyListModel>[] ;
    if(currencyModel != null)
      {
        if(currencyModel.bpi.usd != null)
          {
            var getCode = currencyModel.bpi.usd.code;
            var getSymbol = currencyModel.bpi.usd.symbol;
            var getRate = currencyModel.bpi.usd.rate;
            var getDescription = currencyModel.bpi.usd.description;
            var getRateFloat = currencyModel.bpi.usd.rateFloat;
            list.add(CurrencyListModel(
                code: getCode,
                symbol: getSymbol,
                rate: getRate,
                description: getDescription,
                rateFloat: getRateFloat)) ;
          }

        if(currencyModel.bpi.gbp != null)
        {
          var getCode = currencyModel.bpi.gbp.code;
          var getSymbol = currencyModel.bpi.gbp.symbol;
          var getRate = currencyModel.bpi.gbp.rate;
          var getDescription = currencyModel.bpi.gbp.description;
          var getRateFloat = currencyModel.bpi.gbp.rateFloat;
          list.add(CurrencyListModel(
              code: getCode,
              symbol: getSymbol,
              rate: getRate,
              description: getDescription,
              rateFloat: getRateFloat)) ;
        }

        if(currencyModel.bpi.eur != null)
        {
          var getCode = currencyModel.bpi.eur.code;
          var getSymbol = currencyModel.bpi.eur.symbol;
          var getRate = currencyModel.bpi.eur.rate;
          var getDescription = currencyModel.bpi.eur.description;
          var getRateFloat = currencyModel.bpi.eur.rateFloat;
          list.add(CurrencyListModel(
              code: getCode,
              symbol: getSymbol,
              rate: getRate,
              description: getDescription,
              rateFloat: getRateFloat)) ;
        }

      }
    return list;
  }

}
